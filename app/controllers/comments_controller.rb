class CommentsController < ApplicationController

  before_action :get_comment, only:[:destroy]

  def new; end
  
  def create
    if !comment_params[:verification_id].nil?
      @verification = Verification.find(comment_params[:verification_id])
      @case = @verification.case
      @comment = @verification.comments.create(comment_params.except(:verification_id))
      @comment.user_id = current_user.id
      @comment.save!

      owner = User.find(@verification.user_id)
      # UserMailer.verification_notification_email(owner.email, @comment.user_id, @case.id).deliver_now

    else
      @case = Case.find(comment_params[:case_id])
      @comment = @case.comments.create(comment_params)
      @comment.user_id = current_user.id
      @comment.save!
      owner = User.find(@case.user_id)
      # UserMailer.comment_notification_email(owner.email, @comment.user_id, @case.id).deliver_now

    end

    render :create, layout: false
  end

  def destroy
    @comment.destroy!
    redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :case_id, :id, :verification_id)
  end

  def get_comment
    @comment = Comment.find(params[:id])
  end
end

