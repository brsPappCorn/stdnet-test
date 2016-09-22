json.extract! student, :id, :university_id, :major_id, :promo_id, :role_id, :created_at, :updated_at
json.url student_url(student, format: :json)