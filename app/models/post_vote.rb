class PostVote < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  def self.vote_only_once(user_id, post_id)
    @postvote = Postvote.where(user_id: user_id, post_id: post_id).first
    if @postvote.present?
      false
    else
      true
    end

  end
end
