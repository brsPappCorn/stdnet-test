namespace :load_users do
  # Actualmente sólo se cuenta con la siguiente info para empresas y personas: Nombre y apellido, email y nombre de la empresa / profesión (para unas pocas teléfono celular)

  USER_ROW_HEADERS = %w(email first_name last_name date_of_birth document_number mobile_phone other_city)
  USER_REFERENCE_MODEL_HEADERS = { 'city_name' => 'city', 'country_name' => 'country' }

  COMPANY_ROW_HEADERS = %w(company_name position company_address company_nit company_description company_size company_website_url)
  COMPANY_REFERENCE_MODEL_HEADERS = { 'sector_name' => 'sector' }

  PERSON_ROW_HEADERS = %w(occupation profession)

  STUDENT_ROW_HEADERS = ['last_semester', 'gpa', 'exchange_student', 'exchange_university', 'highschool', 'gpa_max',
                         'work_xp', 'xp_company', 'xp_position', 'xp_achievements', 'volunteer_xp', 'volunteer_org',
                         'volunteer_functions', 'programming_skills', 'programing_languages', 'strengths',
                         'areas_to_develop', 'hobbies', 'avatar', 'type_of_student', 'other_major', 'other_university',
                         'other_tools_skills', 'second_xp_company', 'second_xp_position', 'second_xp_achievements',
                         'third_xp_company', 'third_xp_position', 'third_xp_achievements', 'second_volunteer_org',
                         'second_volunteer_functions', 'third_volunteer_org', 'third_volunteer_functions',
                         'second_other_major', 'second_other_university']
  STUDENT_REFERENCE_MODEL_HEADERS = { 'country_name' => 'country', 'university_name' => 'university',
                                      'major_name' => 'major', 'level_name' => 'education_level' }

  desc 'Loads information for companies'
  task :companies => :environment do |tasks, args|
    process_file User::ROLE_COMPANY, Company
  end

  desc 'Loads information for Persons'
  task :persons => :environment do |tasks, args|
    process_file User::ROLE_PERSON, Person
  end

  desc 'Loads information for Students'
  task :students => :environment do |tasks, args|
    process_file User::ROLE_STUDENT, Student
  end

  desc 'Load all information'
  task :all => :environment do |tasks, args|
    puts 'Processing Companies.xlsx'
    process_file User::ROLE_COMPANY, Company

    puts 'Processing People.xlsx'
    process_file User::ROLE_PERSON, Person

    puts 'Processing Students.xlsx'
    process_file User::ROLE_STUDENT, Student
  end

  private
  def process_file(role, klass)
    require 'roo'

    dir_path = Rails.root.join 'users', klass.to_s.downcase.pluralize
    Dir[dir_path.join('*.xlsx')].each do |file_name|
      file = File.open dir_path.join(file_name)
      xlsx = Roo::Spreadsheet.open file
      sheet = xlsx.sheet 0
      header = sheet.row 2

      (3..sheet.last_row).each do |i|
        row = sheet.row i

        begin
          user = process_user_row row, header, role

          case role
            when User::ROLE_COMPANY
              process_company_row user, row, header
            when User::ROLE_PERSON
              process_person_row user, row, header
            when User::ROLE_STUDENT
              process_student_row user, row, header
            else
              puts "Incorrect role id: #{role}"
          end
        rescue Exception => e
          puts "==> Row number #{i} could be loaded: #{e.message}"

          if user
            user.errors.messages.map { |key, value| puts "* #{key.to_s} #{value}" } unless user.valid?
            user.destroy if user.persisted?
          end
        end
      end
    end
  end

  def process_user_row(row, header, role_id)
    temp_password = Devise.friendly_token
    attributes = { password: temp_password, password_confirmation: temp_password, role_id: role_id }

    process_attributes User, header, row, USER_ROW_HEADERS, USER_REFERENCE_MODEL_HEADERS, attributes
  end

  def process_company_row(user, row, header)
    attributes = { user: user }

    company = process_attributes Company, header, row, COMPANY_ROW_HEADERS, COMPANY_REFERENCE_MODEL_HEADERS, attributes
    user.save!
    company
  end

  def process_person_row(user, row, header)
    attributes = { user: user }

    person = process_attributes Person, header, row, PERSON_ROW_HEADERS, Hash.new, attributes
    user.save!
    person
  end

  def process_student_row(user, row, header)
    attributes = { user: user }

    student = process_attributes Student, header, row, STUDENT_ROW_HEADERS, STUDENT_REFERENCE_MODEL_HEADERS, attributes

    header.each_with_index do |header_name, index|
      if header_name.eql? 'tool_name'
        tool_names = row[index].to_s.split(',').map { |tool| tool.strip }
        tools = []

        tool_names.each do |tool_name|
          tools << find_relation('tool', header_name, tool_name)
        end

        student.tools = tools
      elsif header_name.eql? 'learnt_languages'
        language_pairs = row[index].to_s.split(',').map { |language_level_pair| language_level_pair.split(';') }
        languages = []

        language_pairs.each do |language_pair|
          language = find_relation 'language', 'language_name', language_pair.first
          languages << LearntLanguage.new({ language: language, language_level: language_pair.last })
        end

        student.learnt_languages = languages
      end
    end

    user.save!
    student
  end

  def process_attributes(klass, header, row, row_headers, reference_model_headers, attributes)
    header.each_with_index do |header_name, index|
      unless row[index].to_s.blank?
        if row_headers.include? header_name
          attributes[header_name] = row[index]
        elsif reference_model_headers.keys.include? header_name
          attributes[reference_model_headers[header_name]] = find_relation reference_model_headers[header_name], header_name, row[index]
        end
      end
    end

    klass.new attributes
  end

  def find_relation(class_name, attribute_name, value)
    camelized_class = class_name.camelize
    results = camelized_class.constantize.where(attribute_name.to_sym => value)

    if results.empty?
      raise "A record with { #{attribute_name.to_s}: '#{value}' } for class #{class_name} was not found."
    else
      results.first
    end
  end
end