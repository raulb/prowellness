class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :post_id
      t.integer :month
      t.integer :year
      t.integer :visits, :default => 0
    end

    add_index :stats, :year
    add_index :stats, :month
    add_index :stats, :post_id
    add_index :stats, :visits
  end
end
