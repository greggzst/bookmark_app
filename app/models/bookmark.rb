require 'uri'
require 'nokogiri'
require 'open-uri'
require 'digest'

class Bookmark < ApplicationRecord
  belongs_to :website, optional: true
  has_many :bookmark_tags, dependent: :destroy
  has_many :tags, through: :bookmark_tags
  validates :url, presence: true, length: { minimum: 3 }
  validate :url_valid?
  validates :url, uniqueness: { case_sensitivity: false }
  before_save :set_website, :set_title_and_description, :create_short_url

  private
    def url_valid?
      uri = URI.parse(url)
      unless uri.is_a?(URI::HTTP) && !uri.host.nil?
        errors.add(:url, " is invalid")
      end
    end

    #associate bookmark with website
    def set_website
      uri = URI.parse(url)
      if website = Website.where(url: uri.host).first
        self.website = website
      else
        website = Website.create(url: uri.host)
        self.website = website
      end
    end

    #set title and description according to title and description of the website
    def set_title_and_description
      website = Nokogiri::HTML(open(self.url))
      self.title = website.css('title').text
      self.description = website.at("meta[name='description']")['content'] unless website.at("meta[name='description']").nil?
    end

    def create_short_url
      md5 = Digest::MD5.hexdigest(self.url)
      self.short_url = "http://bk.mk/#{md5[0,7]}"
    end
end
