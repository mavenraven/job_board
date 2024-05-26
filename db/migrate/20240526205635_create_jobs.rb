class CreateJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :category
      t.string :salary_range
      t.string :employment_type
      t.string :contact
      t.text :description
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
