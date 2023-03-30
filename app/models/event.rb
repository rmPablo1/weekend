class Event < ApplicationRecord
  belongs_to :user
  has_many :invitations
  validates :start_time, presence: true
  validates :end_time, presence: true
end
