class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :image
      t.timestamps
    end
  end
end
