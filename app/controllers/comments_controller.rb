class CommentsController < ApplicationController

  def new; end
  
  def create
    @case = Case.find(comment_params[:case_id])
    @comment = @case.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save!
    owner = User.find(@case.user_id)
    UserMailer.comment_notification_email(owner.email, @comment.user_id, @case.id).deliver_now

    render :create, layout: false
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :case_id)
  end
end

