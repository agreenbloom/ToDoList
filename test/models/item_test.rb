require 'test_helper'



class ItemTest < ActiveSupport::TestCase
  setup { @item = Item.create! title: "test title", description: "this is a test description", state: "pending"}
  setup {@user = User.create! email: "a@b.com", password: "password"}
  teardown {Item.delete_all; User.delete_all}

  it "has an initial state in the model" do
    item = Item.new
    @item.state.must_equal "pending"
  end


  describe "#title" do
    it "return name of the item" do
      @item.title.must_equal "test title"
    end
  end

  describe "#description" do
    it "it should return the description of the item" do
      @item.description.must_equal "this is a test description"
    end
  end

  # describe "state" do
  #   it "is invalid without a state" do
  #     invalid_params = { title: "test title", description: "this is a test description", state: ""}
  #     i = Item.create!(invalid_params)

  #     i.wont_be :valid?
  #     i.errors[:state].must_be :present?
  #   end
  # end

# will finish this test when I merge w/ master to have user_id colum
  # describe "user " do
  #   it "should have a user" do
  #     item_params_with_user = { title: "test title", description: "this is a test description", user_id: @user}
  #     i = Item.create!(item_params_with_user)
  #     i.will_be :valid?
  #   end
  # end

  #do we test state machiene stuff or is the assumption that it works because it is a gem doing  all the hard work?


end
