class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  def create
    puts "***************\n"*99
    puts comment_params.inspect
    puts params.inspect
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.save
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end

