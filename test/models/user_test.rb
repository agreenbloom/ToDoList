require "test_helper"
class UserTest < ActiveSupport::TestCase

  describe User do

    let(:user_params) { { email: "john@example.com", password: "password" } }
    let(:user) { User.new user_params }

    it "is valid with valid params" do

      user.must_be :valid? # Must create with valid params
    end

    it "is invalid without an email" do
      # Delete email before user let is called
      invalid_params = {}
      u = User.new(invalid_params)

      u.wont_be :valid? # Must not be valid without email
      u.errors[:email].must_be :present? # Must have error for missing email
    end

  end
end