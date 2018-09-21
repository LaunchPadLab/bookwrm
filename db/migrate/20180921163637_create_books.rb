class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.belongs_to :author, index: true
      t.string :title
      t.text :description
      t.string :isbn
      t.string :genre
      t.date :publish_date
      t.integer :num_pages

      t.timestamps
    end
  end
end
