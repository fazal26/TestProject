class Comment < ApplicationRecord
  belongs_to :user
  # belongs_to :case
  belongs to :commentable, polymorphic: true
  
  after_create_commit {
    CommentBroadcastJob.perform_later(self)
  }
end
