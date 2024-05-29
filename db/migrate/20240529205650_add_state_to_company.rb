class AddStateToCompany < ActiveRecord::Migration[7.1]
  def change
    add_column :companies, :state, :string
  end
end
