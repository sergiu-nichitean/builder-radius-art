require 'open-uri'

class GenerateSongWorker
  include Sidekiq::Worker

  def perform(song_id, feed_id)
    song = Song.find_by(id: song_id)

    return unless song

    begin
      song_data = nil

      100.times do
        song_data = HTTParty.get(
          "#{Rails.configuration.suno_api_url}/query?ids=#{feed_id}",
          headers: {
            'Content-Type' => 'application/json',
            'api-key' => Rails.application.credentials.suno_api_key
          }
        )

        unless song_data.first && song_data.first.is_a?(Hash) && song_data.first['status'].present?
          song.update(error_details: song_data.to_s)
          raise 'Error generating song, please contact support (code 0003).'
        end

        case song_data.first['status']
        when 'complete'
          break
        when 'error'
          raise "Error: #{song_data.first['meta_data']['error_message'].gsub(/suno/i, '')}"
        else
          sleep 10
        end
      end

      stability_prompt = CGI.escape(
        "A square music vinyl album cover with a CAT on it, in the style of a vinyl album cover, only graphics, NO TEXT OR LETTERS. Creatively, it should include the following music elements: #{song.keywords}, Description: #{song.description}"
      )

      stability_response = HTTParty.post(
        'https://api.stability.ai/v2beta/stable-image/generate/core',
        headers: {
          'Content-Type' => 'multipart/form-data; boundary="---abcd---"',
          'Accept' => 'application/json',
          'Authorization' => "Bearer #{Rails.application.credentials.stability_ai_api_key}"
        },
        multipart: true,
        body: { prompt: stability_prompt }
      )

      if stability_response['image']
        image_blob = ActiveStorage::Blob.create_and_upload!(
          filename: "#{Rails.configuration.site_name}-#{song_id}.png",
          io: StringIO.new(Base64.decode64(stability_response['image']))
        )
      elsif stability_response['message']
        raise "Cover generation error: #{stability_response['message']}"
      else
        raise "Error generating song, please contact support (code 0004)."
      end

      if song_data.first['audio_url']
        audio_blob = ActiveStorage::Blob.create_and_upload!(
          filename: "#{Rails.configuration.site_name}-#{song_id}.mp3",
          io: URI.open(song_data.first['audio_url'])
        )

        song.update(
          name: song_data.first['title'],
          music_url: audio_blob.url.split('?').first,
          cover_url: image_blob.url.split('?').first,
          lyrics: song_data.first['meta_data']['prompt'],
          status: :finished
        )

        song.user.update(credits: song.user.credits - 10)
      else
        song.update(
          error: 'Error generating song, please contact support (code 0002).',
          status: :error
        )
      end
    rescue => error
      song.update(
        error: error,
        status: :error
      )
    end
  end
end
