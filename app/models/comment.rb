class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :case

  after_create_commit {
    CommentBroadcastJob.perform_later(self)
  }
end
