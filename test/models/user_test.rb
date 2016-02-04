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

    it "is invalid without a password" do
      invalid_params = { email: "test@test.com"}
      u = User.new(invalid_params)

      u.wont_be :valid?
      u.errors[:password].must_be :present?
    end

    let(:user_test)   { User.create! email: 'test@test.com', password: "password" }
    it 'works' do
      user_test.must_be_instance_of User
    end
  end
end