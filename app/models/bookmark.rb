class Bookmark < ApplicationRecord
  belongs_to :website
  has_many :bookmarktags
  has_many :tags, through: :bookmarktags
end
