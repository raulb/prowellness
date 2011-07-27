class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.text :excerpt
      t.text :body
      t.integer :state, :default => 0
      t.datetime :publish_date
      t.integer :user_id
      t.integer :comments_count, :default => 0
      t.column :tags, "character varying(255)[]"
      t.column :categories, "character varying(255)[]"
      t.timestamps
    end
  end
end
