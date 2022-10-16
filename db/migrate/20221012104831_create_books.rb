class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books, id: :uuid do |t|
      t.string :title
      t.date :release_date
      t.integer :edition
      t.string :genre
      t.string :isbn
      t.string :iccn
      t.string :oclc
      t.references :publisher, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
