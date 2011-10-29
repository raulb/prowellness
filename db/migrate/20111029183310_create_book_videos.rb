class CreateBookVideos < ActiveRecord::Migration
  def change
    create_table :book_videos do |t|
      t.string :code
      t.integer :book_id
      t.text :video

      t.timestamps
    end
  end
end
