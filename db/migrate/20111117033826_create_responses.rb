class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string  :name
      t.integer :guests, :nil => false, :default => 1
      t.string  :ip
      t.timestamps
    end
  end
end
