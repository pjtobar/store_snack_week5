class UsersController < ApplicationController
  before_action :set_comment, only: %i[approve refuse]
  before_action :check_login_admin, only: %i[pending_approval approve refuse]
  before_action :check_login, only: %i[index show]

  def index
    @users = User.with_role :client
  end

  def show
    @user = User.find(params[:id])
    redirect_to users_path if @user.has_role? :admin
    @commentable = @user
    @comments = @commentable.comments.approve
    @comment = Comment.new
    # @feedback = Feedback.new
  end

  def pending_approval
    @review_pending = Comment.type_user
  end

  def approve; end

  def refuse; end

  private

  def set_comment
    @comment = Comment.find(params[:id])
    if action_name == 'approve'
      @comment.state = 1
    else
      @comment.state = 0
    end
    @comment.save
    redirect_to pending_approval_users_path
  end

  def check_login_admin
    unless user_signed_in? && (current_user.has_role? :admin)
      redirect_to products_path and return
    end
  end

  def check_login
    unless user_signed_in?
      redirect_to products_path and return
    end
  end
end
