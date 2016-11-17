module ApplicationHelper

  # Sets active class in navbar links
  def is_active?(link_path)
    if current_page?(link_path)
      'active'
    else
      ''
    end
  end

  # Method for AWS file path
  def aws_url(image)
    "https://s3.amazonaws.com/#{ENV['AWS_BUCKET_NAME']}/#{image.file.path}"
  end

end
