json.extract!(@collection, :id, :name, :description, :max_supply,
      :treasury_wallet, :price_sol, :song_id,
      :flight_number, :origin, :destination, :departure_date,
      :departure_time, :arrival_date, :arrival_time, :royalties_percent,
      :royalties_wallet, :collection_description,
      :type, :collection_name, :animation_url, :image_url, :collection_image_url)
