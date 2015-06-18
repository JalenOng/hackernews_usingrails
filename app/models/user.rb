class User < ActiveRecord::Base
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true


  has_many :posts
  has_many :comments
  has_many :postvotes
  has_many :postcomments



  def self.authenticate(username, password)
    @user = User.where(username: username, password: password).first

    if @user.present?
      @user
    else
      nil
    end
  end
end
