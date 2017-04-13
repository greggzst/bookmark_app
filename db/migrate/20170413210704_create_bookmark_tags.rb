class CreateBookmarkTags < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmark_tags do |t|
      t.belongs_to :bookmark, index: true
      t.belongs_to :tag, index: true
      t.timestamps
    end
  end
end
