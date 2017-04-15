class Website < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
end
