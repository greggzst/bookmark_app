class Website < ApplicationRecord
  has_many :bookmarks, dependent: :destroy

  def self.search(search)
    search = "%#{search}%"
    #get all the bookmarks meeting criteria
    result = Bookmark.includes(:tags).where('title LIKE :s OR url LIKE :s OR tags.name LIKE :s', s:search).references(:tags)
    #get webiste index and bookmark index and map them in one hash
    result.map(&:get_website_id_and_id).inject({}) do |acc, hash|
      acc.merge(hash) do |key, v1, v2|
        arr = [v1, v2]
        arr.flatten
      end
    end
  end
end
