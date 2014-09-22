class Message < ActiveRecord::Base
  validates :content, presence: true, length: { maximum: 140 }
  validates :author, presence: true, length: { maximum: 25 }
  validates :url, allow_blank: true, inclusion: { in: %w(http www https),
    message: "%{value} is not valid" }
end