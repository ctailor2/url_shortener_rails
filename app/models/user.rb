class User < ActiveRecord::Base
  attr_accessible :email, :name, :password
  has_many :urls

  validates :email, uniqueness: true
  validates :password, presence: true, length: { in: 6..20 }
end
