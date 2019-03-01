module AdminPanelHelper
  def is_opted(user_id, case_id)
    if Optin.where({user_id: user_id, case_id: case_id}).empty?
        false
    else
        true
    end
end
end
