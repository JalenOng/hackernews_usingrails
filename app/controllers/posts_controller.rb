class PostsController < ApplicationController
  before_filter :set_post, :only => [:show, :edit, :update, :destroy, :upvote]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save!
      redirect_to @post, notice: "Your post has been created"
    else
      render :new
    end

  end

  def edit

  end

  def update

    @post.update(post_params)

    if @post.save!
      redirect_to @post, notice: "Your post is updated"
    else
      render :edit
    end
  end

  def destroy
  end

  def show
    @comments = @post.comments
  end

  def upvote
    @vote = Postvote.vote_only_once(@user.id, @post.id)
    if @vote
      @upvote = Postvote.create(user_id: @user.id, post_id: @post.id)
    end

    # {post: @post, count: @post.postvotes.count}.to_json

  end


  private

  def set_post

    @post = Post.find(params[:id])
    @posts = Post.all
    @user = User.find(session[:id])

  end

  def post_params
    params.require(:post).permit(:title, :link)

  end
end


