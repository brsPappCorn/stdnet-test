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

  # Method to calculate user's (student role only) age, so that companies/people will be able to know this information.
  def user_age
    user_id = current_user.id
    user = User.find_by_id(user_id)
    unless user.date_of_birth.nil?
      Date.today.year - user.date_of_birth.year
    end
  end

  # Method to verify if an attribute is nil?
  def is_attribute_nil?(attribute)
    # TODO: application_helper - write is_attribute_nil? method. Needed to refactor students/show view (too many unless blocks)
  end
end
