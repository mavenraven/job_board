class SalaryRangeToIntegerColumns < ActiveRecord::Migration[7.1]
  def change
    remove_column(:jobs, :salary_range)
    add_column(:jobs, :salary_type, :integer)
    add_column(:jobs, :salary_min, :integer)
    add_column(:jobs, :salary_max, :integer)
  end
end
