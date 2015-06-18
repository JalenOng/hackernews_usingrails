class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :link, presence: true

  has_many :comments
  has_many :post_votes
  belongs_to :user
end
