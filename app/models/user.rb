class User < ApplicationRecord
  has_secure_password
  
  validates_uniqueness_of :email
  
  before_validation do self.email.downcase! end
end
