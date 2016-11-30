module ApplicationHelper

  # Sets active class in navbar links
  def is_active?(link_path)
    if current_page?(link_path)
      'active'
    else
      ''
    end
  end

  # TODO: Check this method
  def mailer_header_color
    if @resource.role_id  == User::ROLE_STUDENT
      '#6AADE4'
    elsif @resource.role_id == User::ROLE_COMPANY
      '#5A2A00'
    elsif @resource.role_id == User::ROLE_PERSON
      '#1E2056'
    end
  end

  # Method for AWS file path
  def aws_url(image)
    "https://s3.amazonaws.com/#{ENV['AWS_BUCKET_NAME']}/#{image.file.path}"
  end

end
