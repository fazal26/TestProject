module CommentsHelper
    def is_self_comment(user_id)
        if current_user.id == user_id
            true
        else
            false
        end
    end
end
