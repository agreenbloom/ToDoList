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
  # is it not recommended to use describe something do? - docs are confusing
  # describe Item do
  #   subject { Item.new }
  #   it {must have_valid(:title).when("Test") }
  #   it { wont have_valid(:title).when("", nil, "bad")}
  # end



end
