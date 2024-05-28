# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  category    :string
#  contact     :string
#  description :text
#  salary_max  :integer
#  salary_min  :integer
#  salary_type :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :integer          not null
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
  enum salary_type: {
    yearly: 1,
    hourly: 2,
  }

  belongs_to :company
end
