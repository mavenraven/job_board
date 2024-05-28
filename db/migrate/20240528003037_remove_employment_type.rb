class RemoveEmploymentType < ActiveRecord::Migration[7.1]
  def change
    remove_column(:jobs, :employment_type)
  end
end
