class CommentsController < ApplicationController


  def create
    @comment = Comment.create(body: params["body"], user_id: @user.id, post_id: @post.id)


  end

  def upvote
  end

  private

  def before blabla
    @user = User.find(session[:id])
    @post = Post.find(params[:post_id])

  end

end
