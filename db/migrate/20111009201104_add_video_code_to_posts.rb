class AddVideoCodeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :video_code, :string
  end
end
