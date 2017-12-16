class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets

  def slug
    self.username.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    all.select do |user|
      user.slug == slug
    end.first
  end
end
