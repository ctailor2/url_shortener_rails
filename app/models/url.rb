require 'faker'
require 'uri'

class Url < ActiveRecord::Base
  attr_accessible :click_count, :long_url, :short_url
  belongs_to :user

  validate :url_must_be_valid, :on => :create
  validates :short_url, :uniqueness => true
  before_save :generate_short_url

  def generate_short_url
    new_short = "/" + Faker::Lorem.characters(7)
    until short_url_unique?(new_short)
      new_short = "/" + Faker::Lorem.characters(7)
    end
    self.short_url = new_short
  end

  def short_url_unique?(new_short)
    Url.find_by_short_url(new_short).nil?
  end

  def url_must_be_valid
    unless long_url.match(URI::regexp)
      errors.add(:long_url, 'must be valid')
    end
  end

end
