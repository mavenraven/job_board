json.extract! company, :id, :name, :hq, :logo_url, :website_url, :email, :description, :created_at, :updated_at
json.url company_url(company, format: :json)
