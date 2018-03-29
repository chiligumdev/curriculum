class AddEditProfileFields < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :age, :string
    add_column :users, :company, :string
    add_column :users, :job_position, :string
    add_column :users, :university, :string
    add_column :users, :course, :string
  end
end
