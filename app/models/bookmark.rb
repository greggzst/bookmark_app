require 'uri'

class Bookmark < ApplicationRecord
  belongs_to :website
  has_many :bookmark_tags
  has_many :tags, through: :bookmark_tags
  validates :url, presence: true, length: { minimum: 3 }
  validate :url_valid?
  validates :url, uniqueness: { case_sensitivity: false }

  private
    def url_valid?
      uri = URI.parse(url)
      unless uri.is_a?(URI::HTTP) && !uri.host.nil?
        errors.add(:url, " is invalid")
      end
    end
end
