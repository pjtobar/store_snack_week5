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
end
