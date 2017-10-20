 module StudentsHelper

  # Helper method for building rails helper select from constants declared in the model
  def student_yes_no_select_type
    [
        ['No', Student::OPTION_FOR_NO],
        ['Sí', Student::OPTION_FOR_YES]
    ]
  end

  # Helper methods to display friendly name instead of select value
  def student_exchange_student_select_friendly(student)
    if student.exchange_student.to_i == 0
      'No'
    else student.exchange_student.to_i == 1
      'Sí'
    end
  end

  def student_work_xp_select_friendly(student)
    if student.work_xp.to_i == 0
      'No'
    else student.work_xp.to_i == 1
     'Sí'
    end
  end

  def student_volunteer_xp_select_friendly(student)
    if student.volunteer_xp.to_i == 0
      'No'
    elsif student.volunteer_xp.to_i == 1
      'Sí'
    end
  end

  def student_programming_skills_select_friendly(student)
    if student.programming_skills.to_i == 0
      'No'
    else student.programming_skills.to_i == 1
     'Sí'
    end
  end


  # Helper method for building rails helper select from constants declared in the model
  def type_of_student_select_type
    [
        ['Diurno', Student::TYPE_OF_STUDENT_DAY],
        ['Nocturno', Student::TYPE_OF_STUDENT_NIGHT],
        ['Virtual', Student::TYPE_OF_STUDENT_VIRTUAL],
        ['Esperando diploma', Student::TYPE_OF_STUDENT_DIPLOMA_PENDING],
        ['Graduado', Student::TYPE_OF_STUDENT_GRADUATE]
    ]
  end

  def type_of_student_select_friendly(user)
    unless user.student.type_of_student.nil?
      if user.student.type_of_student.to_i == 0
        'Diurno'
      elsif user.student.type_of_student.to_i == 1
        'Nocturno'
      elsif user.student.type_of_student.to_i == 2
        'Virtual'
      elsif user.student.type_of_student.to_i == 3
        'Esperando diploma'
      elsif user.student.type_of_student.to_i == 4
        'Graduado'
      end
    end
  end

end






