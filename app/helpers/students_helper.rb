module StudentsHelper

  # Helper method for building rails helper select from constants declared in the model
  def student_work_xp_select_type
    [
        ['No', Student::OPTION_FOR_NO],
        ['Sí', Student::OPTION_FOR_YES]
    ]
  end

  # TODO: Students_helper - Refactor student_work_xp_select_friendly
  # Helper method to display friendly name instead of select value
  def student_work_xp_select_friendly(student)
    if student.work_xp == false
      'No'
    else student.work_xp == true
      'Sí'
    end
  end

  # Helper method for building rails helper select from constants declared in the model
  def student_volunteer_xp_select_type
    [
        ['No', Student::OPTION_FOR_NO],
        ['Sí', Student::OPTION_FOR_YES]
    ]
  end

  # Helper method to display friendly name instead of select value
  def student_volunteer_xp_select_friendly(student)
    if student.volunteer_xp == false
      'No'
    elsif student.volunteer_xp == true
      'Sí'
    end
  end

end


