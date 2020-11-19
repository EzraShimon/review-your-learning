ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def valid_user_hash_for_create
     {
       email: "notarealemail@reviewyourlearning.com",
       password: "ilovereviewingmylearning2020",
       password_confirmation: "ilovereviewingmylearning2020"
     }
  end
  
  def invalid_user_hash_for_create
     {
       email: "notarealemail@reviewyourlearning.com",
       password: "ilovereviewingmylearning2020",
       password_confirmation: "passwordandpasswordconfirmationdonotmatch"
     }
  end
end
