class CommentsController < ApplicationController

  before_action :get_comment, only:[:destroy]

  def new
    authorize Comment
  
  end
  
  def create
    authorize Comment
    if !comment_params[:verification_id].nil?
      @verification = Verification.find(comment_params[:verification_id])
      @case = @verification.case
      @comment = @verification.comments.create(comment_params.except(:verification_id))
      @comment.user_id = current_user.id
      owner = User.find(@verification.user_id)
      UserMailer.verification_comment_notification_email(owner.email, @comment.user_id, @case.id, @verification.id).deliver_later
    else
      @case = Case.find(comment_params[:case_id])
      @comment = @case.comments.create(comment_params)
      @comment.user_id = current_user.id
      owner = User.find(@case.user_id)
      UserMailer.comment_notification_email(owner.email, @comment.user_id, @case.id).deliver_later
    end
    @comment.save!
    render :create, layout: false
  end

  def destroy
    @comment.destroy!
    redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :case_id, :id, :verification_id, :parent_id)
  end

  def get_comment
    @comment = Comment.find(params[:id])
  end
end

