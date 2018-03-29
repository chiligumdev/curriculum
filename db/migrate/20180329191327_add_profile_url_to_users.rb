class AddProfileUrlToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :profile_url, :string
  end
end
