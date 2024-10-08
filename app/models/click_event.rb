class ClickEvent < ApplicationRecord
  belongs_to :user

  def event_type
    click_data.split(':')[0] # TODO: readable name
  end
end
