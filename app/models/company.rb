# == Schema Information
#
# Table name: companies
#
#  id          :integer          not null, primary key
#  city        :string
#  description :text
#  email       :string
#  hq          :string
#  logo_url    :string
#  name        :string
#  state       :string
#  website_url :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Company < ApplicationRecord
  has_many :jobs, dependent: :destroy
end
