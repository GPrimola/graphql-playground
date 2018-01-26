require 'test_helper'

class Resolvers::CreateUserTest < ActiveSupport::TestCase
  test 'creating a new user' do
    args = {
      name: 'User',
      authProvider: {
        signupData: {
          email: 'anemail@example.com',
          password: 'secure-password'
        }
      }
    }

    user = Resolvers::CreateUser.new.call(nil, args, {})

    assert user.persisted?
    assert_equal user.name, 'User'
    assert_equal user.email, 'anemail@example.com'
  end
end
