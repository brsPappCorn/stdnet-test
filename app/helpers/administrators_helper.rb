module AdministratorsHelper

  def get_user_excel_path
    file_path = new_excel_file_path
    excel = Axlsx::Package.new

    excel.workbook.add_worksheet(name: 'Estudiantes') do |sheet|
      sheet.add_row USER_HEADER_ROWS + STUDENT_HEADER_ROWS
      sheet.add_row USER_ROWS + STUDENT_ROWS

      students = User.all_by_role User::ROLE_STUDENT
      students.each do |student|
        write_row_for_student student, sheet
      end
    end

    excel.workbook.add_worksheet(name: 'Empresas') do |sheet|
      sheet.add_row USER_HEADER_ROWS + COMPANY_HEADER_ROWS
      sheet.add_row USER_ROWS + COMPANY_ROWS

      companies = User.all_by_role User::ROLE_COMPANY
      companies.each do |company|
        write_row_for_company company, sheet
      end
    end

    excel.workbook.add_worksheet(name: 'Personas') do |sheet|
      sheet.add_row USER_HEADER_ROWS + PERSON_HEADER_ROWS
      sheet.add_row USER_ROWS + PERSON_ROW

      people = User.all_by_role User::ROLE_PERSON
      people.each do |person|
        write_row_for_person person, sheet
      end
    end

    excel.workbook.add_worksheet(name: 'Oportunidades') do |sheet|
      sheet.add_row OPPORTUNITY_HEADER_ROWS
      sheet.add_row OPPORTUNITY_ROWS

      Opportunity.all.each do |opportunity|
        write_row_for_opportunity opportunity, sheet
      end
    end

    excel.serialize file_path
    file_path
  end

  private
  USER_HEADER_ROWS = ['Email de tu cuenta', 'Nombre(s)', 'Apellidos', 'Edad', 'País', 'Ciudad en la que vives', 'Otra', 'Teléfono celular', 'Documento de identidad', '¿Cómo te enteraste de studNet?', 'Código promocional (no obligatorio)']
  USER_ROWS = %w(email first_name last_name date_of_birth country city other_city mobile_phone document_number referenced_by promo_id)

  # Student
  STUDENT_HEADER_ROWS = ['Universidad', 'Carrera', 'Nivel', 'Universidad segunda carrera', 'Segunda carrera', 'Nivel segunda carrera', 'Otra universidad', 'Otra carrera', 'Otras carreras', 'Último semestre cursado', 'Calificación máxima en tu universidad', 'Promedio académico acumulado', 'Tipo de estudiante', '¿Has realizado algún intercambio académico?', 'Indica el país en el cual realizaste el intercambio', 'Indica el nombre de la universidad en la cual realizaste el intercambio', 'Indica el nombre del colegio del que te graduaste', '¿Tienes experiencia laboral?', 'Indica el nombre de la empresa en la que trabajaste', 'Indica el nombre de tu cargo en la empresa', 'Indica tus principales funciones y logros en el cargo', 'Indica el nombre de la empresa en la que trabajaste 2', 'Indica el nombre de tu cargo en la empresa 2', 'Indica tus principales funciones y logros en el cargo 2', 'Indica el nombre de la empresa en la que trabajaste 3', 'Indica el nombre de tu cargo en la empresa 3', 'Indica tus principales funciones y logros en el cargo 3', '¿Realizas o has realizado una actividad social / de voluntariado?', 'Indica el nombre de la organización donde realizaste esta actividad', 'Indica tus funciones en esta organización', 'Indica el nombre de la organización donde realizaste esta actividad 2', 'Indica tus funciones en esta organización 2', 'Indica el nombre de la organización donde realizaste esta actividad 3', 'Indica tus funciones en esta organización 3', 'Idiomas', 'Herramientas', '¿Qué otras herramientas sabes manejar / qué otras habilidades tienes?', '¿Sabes programar?', 'Por favor indica en qué lenguajes sabes programar', '¿Cuáles son tus principales fortalezas?', '¿En qué áreas te gustaría desarrollar tu carrera profesional?', 'Describe brevemente tus intereses, tus hobbies y demás información que describa quien eres']
  STUDENT_ROWS = %w(university_name major_name level_name second_university_name second_major_name second_level_name other_university other_major other_majors last_semester gpa_max gpa type_of_student exchange_student exchange_country exchange_university highschool work_xp xp_company xp_position xp_achievements second_xp_company second_xp_position second_xp_achievements third_xp_company third_xp_position third_xp_achievements volunteer_xp volunteer_org volunteer_functions second_volunteer_org second_volunteer_functions third_volunteer_org third_volunteer_functions learnt_languages tools other_tools_skills programming_skills programing_languages strengths areas_to_develop hobbies)

  STUDENT_TO_SINGLE_RELATIONS = { 'university_name' => 'university', 'major_name' => 'major', 'level_name' => 'education_level', 'second_university_name' => 'second_university', 'second_major_name' => 'second_major', 'second_level_name' => 'second_education_level', 'exchange_country' => 'country' }
  STUDENT_TO_MANY_RELATIONS = { 'other_majors' => 'majors',  'tools' => 'tools', 'learnt_languages' => 'learnt_languages' }

  # Company
  COMPANY_HEADER_ROWS = ['Nombre de la empresa', 'NIT', 'Breve descripción de tu empresa', 'Sector', 'Tamaño', 'Página web', 'Cargo', 'Dirección']
  COMPANY_ROWS = %w(company_name company_nit company_description sector_name company_size company_website_url position company_address)

  COMPANY_TO_SINGLE_RELATIONS = { 'sector_name' => 'sector' }

  # Person
  PERSON_HEADER_ROWS = ['Ocupación',	'Profesión / Carrera']
  PERSON_ROW = %w(occupation	profession)

  # Opportunities
  OPPORTUNITY_HEADER_ROWS = ['Email de tu cuenta:', 'Tipo de ususario:', 'Nombre de la empresa: / Nombre (completo) de la persona:', 'Tipo de oferta', 'Título de la oferta', 'Descripción de las actividades a realizar', 'Descripción de las habilidades y conocimientos requeridos', '¿Permitir aplicaciones de todas las carreras?', '¿De qué carreras buscas los estudiantes?', 'Pregunta al estudiante', 'Fecha de cierre de la convocatoria (Antes: fecha de inicio del trabajo / proyecto)', 'Fijar fechas', 'Duración del trabajo / proyecto', 'Duración del trabajo (en días, semanas o meses)', 'Tiempo requerido del estudiante', '¿Quieres poner un valor para el proyecto o escuchar ofertas de los estudiantes?', 'Salario / valor del proyecto', '¿Quieres recibir el portafolio de los estudiantes que apliquen a tu oferta? (Para ofertas de artes, diseño, arquitectura y afines)', '¿Cuántos estudiantes necesitas para esta oferta?', 'Número de aplicaciones', 'Correos de aplicantes', 'Estado de la oferta', 'Candidatos seleccionados']
  OPPORTUNITY_ROWS = %w(email role_type company_person_name opportunity_type_description opportunity_title activity_description skills_description other_majors majors question_for_student date_ini_type_friendly date_ini duration_type_description opportunity_duration availability_description cost_or_offer_description opportunity_cost receive_portfolio number_of_students number_of_applicants	applicants_emails	approved_state selected_applicant_emails)

  OPPORTUNITY_TO_MANY_RELATIONS = %w(majors)

  def new_excel_file_path
    file_name = "users-#{Time.now.strftime '%d-%m-%Y-%H_%M'}.xlsx"
    Pathname.new(Dir.tmpdir).join file_name
  end

  def write_row_for_student(user, sheet)
    row = []
    student = user.student

    write_rows_for_user user, row

    STUDENT_ROWS.each do |attribute|
      if STUDENT_TO_SINGLE_RELATIONS.keys.include? attribute
        if student.send(STUDENT_TO_SINGLE_RELATIONS[attribute]).nil?
          row << nil
        else
          row << student.send(STUDENT_TO_SINGLE_RELATIONS[attribute]).name
        end
      elsif STUDENT_TO_MANY_RELATIONS.keys.include? attribute
        temp_row = []

        if attribute.eql? 'learnt_languages'
          student.send(STUDENT_TO_MANY_RELATIONS[attribute]).each do |learnt_language|
            if !learnt_language.language.nil? && !learnt_language.language_level.nil?
              temp_row << "#{learnt_language.language.name} (#{learnt_language.language_level})"
            end
          end
        else
          student.send(STUDENT_TO_MANY_RELATIONS[attribute]).each do |model|
            temp_row << model.name
          end
        end

        row << (temp_row.empty? ? nil : temp_row.join(','))
      else
        if attribute.eql? 'type_of_student'
          row << student.friendly_type_of_student
        else
          row << (student[attribute].to_s.blank? ? nil : student[attribute])
        end
      end
    end

    sheet.add_row row
  end

  def write_row_for_company(user, sheet)
    row = []
    company = user.company

    write_rows_for_user user, row

    COMPANY_ROWS.each do |attribute|
      if COMPANY_TO_SINGLE_RELATIONS.keys.include? attribute
        if company.send(COMPANY_TO_SINGLE_RELATIONS[attribute]).nil?
          row << nil
        else
          row << company.send(COMPANY_TO_SINGLE_RELATIONS[attribute]).name
        end
      else
        row << (company[attribute].to_s.blank? ? nil : company[attribute])
      end
    end

    sheet.add_row row
  end

  def write_row_for_person(user, sheet)
    row = []
    person = user.person

    write_rows_for_user user, row

    PERSON_ROW.each do |attribute|
      row << (person[attribute].to_s.blank? ? nil : person[attribute])
    end

    sheet.add_row row
  end

  def write_row_for_opportunity(opportunity, sheet)
    row = []

    OPPORTUNITY_ROWS.each do |attribute|
      if attribute.eql? 'email'
        row << opportunity.user.email
      elsif attribute.eql? 'role_type'
        row << opportunity.user.role_name
      elsif attribute.eql? 'company_person_name'
        user = opportunity.user

        if user.role_id == User::ROLE_COMPANY
          row << user.company.company_name
        else
          row << user.full_name
        end
      elsif attribute.eql? 'number_of_applicants'
        row << opportunity.applications.count
      elsif attribute.eql? 'applicants_emails'
        row << opportunity.applied_users.map { |u| u.email }.join(',')
      elsif attribute.eql? 'selected_applicant_emails'
        row << opportunity.selected_students.map { |a| a.applied_user.email }.join(',')
      elsif OPPORTUNITY_TO_MANY_RELATIONS.include? attribute
        temp_row = []

        opportunity.send(attribute).each do |model|
          temp_row << model.name
        end

        row << (temp_row.empty? ? nil : temp_row.join(','))
      else
        row << (opportunity.send(attribute).to_s.blank? ? nil : opportunity.send(attribute))
      end
    end

    sheet.add_row row
  end

  def write_rows_for_user(user, row)
    USER_ROWS.each do |attribute|
      if attribute.eql? 'date_of_birth'
        row << user.friendly_age
      elsif attribute.eql?('country') || attribute.eql?('city')
        if user.send(attribute)
          row << user.send(attribute).name
        else
          row << nil
        end
      elsif attribute.eql? 'referenced_by'
        row << User::REFERENCES_USER[user[attribute].to_i]
      else
        row << (user[attribute].to_s.blank? ? nil : user[attribute])
      end
    end
  end
end
