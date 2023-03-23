class Event < ApplicationRecord
  belongs_to :user
  validates :google_event_id, uniqueness: true
end
