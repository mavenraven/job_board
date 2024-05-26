json.extract! job, :id, :title, :category, :salary_range, :employment_type, :contact, :description, :company_id, :created_at, :updated_at
json.url job_url(job, format: :json)
