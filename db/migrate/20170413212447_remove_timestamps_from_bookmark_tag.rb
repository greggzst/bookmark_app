class RemoveTimestampsFromBookmarkTag < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookmark_tags, :created_at, :string
    remove_column :bookmark_tags, :updated_at, :string
  end
end
