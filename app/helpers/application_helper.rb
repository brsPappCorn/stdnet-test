module ApplicationHelper

  # Sets active class in navbar links
  def is_active?(link_path)
    if current_page?(link_path)
      'active'
    else
      ''
    end
  end

  # Method for user role_id, so the constant Model::ROLE_ID will not have to be called in the view.
  def user_role_id(role_id)
    array_element = role_id.to_i - 1
    current_user.role_id == User::ROLE_ID[array_element]
  end



end
