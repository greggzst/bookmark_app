class Tag < ApplicationRecord
  has_many :bookmarktags
  has_many :bookmarks, through: :bookmarktags
end
