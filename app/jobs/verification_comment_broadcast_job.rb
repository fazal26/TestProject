class VerificationCommentBroadcastJob < ApplicationJob
  queue_as :default

  def perform(comment)
    ActionCable.server.broadcast "verification",{
      comment: render_comment(comment)
    }
  end

  private 
  def render_comment(c)
    VerificationsController.render(
      partial: 'comments/comment',
      locals: {
        comment: c
      }
    )
    end
end
