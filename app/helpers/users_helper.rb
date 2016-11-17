module UsersHelper

  # Helper method for building rails helper select from constants declared in the model
  def student_referenced_by_select_type
    [
        ['Anuncios / publicidad en Facebook', User::REF_FACEBOOK_AD],
        ['Publicaciones en grupos de Facebook', User::REF_FACEBOOK_GROUPS],
        ['Linked In', User::REF_LINKED_IN],
        ['Instagram', User::REF_INSTAGRAM],
        ['Un/a amigo/a', User::REF_FRIEND],
        ['Evento o conferencia', User::REF_EVENT],
        ['Google u otro motor de búsqueda', User::REF_SEM],
        ['Correo electróncio', User::REF_EMAIL],
        ['Universidad', User::REF_STUDENT_UNIVERSITY]
    ]
  end

  def student_referenced_by_select_friendly(student)
    if student.referenced_by.to_i == 0
      'Anuncios / publicidad en Facebook'
    elsif student.referenced_by.to_i == 1
      'Publicaciones en grupos de Facebook'
    elsif student.referenced_by.to_i == 2
      'Linked In'
    elsif student.referenced_by.to_i == 3
      'Instagram'
    elsif student.referenced_by.to_i == 4
      'Un/a amigo/a'
    elsif student.referenced_by.to_i == 5
      'Evento o conferencia'
    elsif student.referenced_by.to_i == 6
      'Google u otro motor de búsqueda'
    elsif student.referenced_by.to_i == 7
      'Correo electróncio'
    elsif student.referenced_by.to_i == 8
      'Universidad'
    end
  end

  def role_show_route(user)
    if user.has_role? User::ROLE_STUDENT
      student_path(user.student)
    elsif user.has_role? User::ROLE_COMPANY
      company_path(user.company)
    elsif user.has_role? User::ROLE_PERSON
      person_path(user.person)
    end
  end

  def average_rating(user)
    rating = user.average_rating

    if rating < 0
      'No tiene'
    else
      rating
    end
  end

end


















