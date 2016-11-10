module ApplicationHelper

  # Sets active class in navbar links
  def is_active?(link_path)
    if current_page?(link_path)
      'active'
    else
      ''
    end
  end

  # Method to calculate user's (student role only) age, so that companies/people will be able to know this information.
  def user_age
    user = User.find_by_id(params[:id])
    now = Time.now.utc.to_date
    unless user.date_of_birth.nil?
      now.year - user.date_of_birth.year - (user.date_of_birth.to_date.change(:year => now.year) > now ? 1 : 0)
    end
  end

  # Method for AWS file path
  def aws_url(image)
    "https://s3.amazonaws.com/#{ENV['AWS_BUCKET_NAME']}/#{image.file.path}"
  end

end
