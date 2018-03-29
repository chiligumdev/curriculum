class AddHeadLineToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :headline, :string
  end
end
