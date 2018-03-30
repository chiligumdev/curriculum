class AddFlagsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :fill_form, :boolean, default: false
    add_column :users, :video_done, :boolean, default: false
  end
end
