class FeedbacksController < ApplicationController

  def create
    Feedback.create(feedback_params)
    redirect_to user_path(feedback_params[:user_id])
  end

  private

  def feedback_params
    params.require(:feedback).permit(:score, :user_id)
  end
end
