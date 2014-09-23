class Song < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  validates :song_title, presence: true, length: { maximum: 140 }
  validates :author, presence: true, length: { maximum: 25 }
  validates :url, format: { with: URI.regexp,
    message: "%{value} is not valid" }
end