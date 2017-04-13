class CreateBookmarks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarks do |t|
      t.string :title
      t.text :description
      t.string :url
      t.string :short_url
      t.references :website, foreign_key: true

      t.timestamps
    end
  end
end
