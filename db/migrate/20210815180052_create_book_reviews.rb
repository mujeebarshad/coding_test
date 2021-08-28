class CreateBookReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :book_reviews do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.integer :rate, null: false
      t.integer :user_id, null: false
      t.integer :book_id, null: false

      t.timestamps
    end
  end
end
