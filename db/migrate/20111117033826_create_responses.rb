class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string  :name
      t.boolean :attending
      t.integer :guests
      t.string  :ip
      t.timestamps
    end
  end
end
