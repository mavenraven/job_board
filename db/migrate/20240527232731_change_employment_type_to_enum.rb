class ChangeEmploymentTypeToEnum < ActiveRecord::Migration[7.1]
  def change
    change_column(:jobs, :employment_type, :integer)
  end
end
