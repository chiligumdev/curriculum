class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :url
      t.string :thumbnail_url
      t.belongs_to :user, foreign_key: true
      t.string :api_id
      t.string :slug

      t.timestamps
    end
  end
end
