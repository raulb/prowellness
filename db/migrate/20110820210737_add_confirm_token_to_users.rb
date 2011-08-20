class AddConfirmTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :confirmation_token, :string, :unique => true
  end
end
