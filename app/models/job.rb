# == Schema Information
#
# Table name: jobs
#
#  id              :integer          not null, primary key
#  category        :string
#  contact         :string
#  description     :text
#  employment_type :string
#  salary_range    :string
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  company_id      :integer          not null
#
# Indexes
#
#  index_jobs_on_company_id  (company_id)
#
# Foreign Keys
#
#  company_id  (company_id => companies.id)
#
class Job < ApplicationRecord
  belongs_to :company
end
