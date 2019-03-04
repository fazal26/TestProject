module CasesHelper
    def is_opted(user_id, case_id)
        if Optin.where({user_id: user_id, case_id: case_id}).empty?
            false
        else
            true
        end
    end

    def validateable(user_id,case_id)
        if (is_verifier || is_admin) && is_opted(user_id, case_id)
            true
        else
            false
        end
    end

    def case_closed(c)
        is_admin && c.closed?
    end
end
