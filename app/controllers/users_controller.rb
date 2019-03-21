class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @commentable = @user
    @comments = @commentable.comments.where(state: 1)
    @comment = Comment.new
  end

  def pending_approval
    @review_pending = Comment.where(state: 0, commentable_type: 'User')
  end

  def approve
    @comment = Comment.find(params[:id])
    @comment.state = 1
    @comment.save
    redirect_to pending_approval_users_path
  end

  def refuse
    @comment = Comment.find(params[:id])
    @comment.state = 2
    @comment.save
    redirect_to pending_approval_users_path
  end
end
