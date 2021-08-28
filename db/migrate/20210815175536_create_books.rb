class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, null: false, index: true
      t.string :auther_name, null: false
      t.string :publisher
      t.integer :edition, null: false

      t.timestamps
    end
  end
end
