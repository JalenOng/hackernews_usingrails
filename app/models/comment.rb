class Comment < ActiveRecord::Base
  validates :body, presence: true

  has_many :commentvotes
  belongs_to :user
  belongs_to :post
end
