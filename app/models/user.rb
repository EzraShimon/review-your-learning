class User < ApplicationRecord
  has_secure_password
  has_many :learnings
  
  validates_uniqueness_of :email
  
  before_validation do self.email.downcase! end
end
