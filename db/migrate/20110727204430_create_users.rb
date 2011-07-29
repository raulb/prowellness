class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name_and_surname
      t.string :email
      t.string :password_digest
      t.boolean :admin, :default => false
      t.timestamps
    end
  end
end
