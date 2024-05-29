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
require "test_helper"

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
