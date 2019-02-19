class Comment < ApplicationRecord
  belongs_to :user
  # belongs_to :case
  belongs_to :commentable, polymorphic: true

  after_create_commit {
    CommentBroadcastJob.perform_later(self);
    VerificationCommentBroadcastJob.perform_later(self)
  }
end
