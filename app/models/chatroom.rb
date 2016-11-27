class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  validates :topic, presence: true, uniqueness: true, case_sensitive: false
  def slug
    topic
  end

  def to_param
    slug
  end
end
