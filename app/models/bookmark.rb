class Bookmark < ApplicationRecord
  belongs_to :website
  has_many :bookmark_tags
  has_many :tags, through: :bookmark_tags
end
