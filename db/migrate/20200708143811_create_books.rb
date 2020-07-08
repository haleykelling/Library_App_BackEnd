class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :authors
      t.string :published_date
      t.text :description
      t.integer :page_count
      t.string :categories
      t.string :image_link
      t.string :isbn_13

      t.timestamps
    end
  end
end
