require 'test_helper'
class ItemTest < ActiveSupport::TestCase



  setup { @item = Item.create! title: "test title", description: "this is a test description", state: "pending"}
  setup {@user = User.create! email: "a@b.com", password: "password"}
  teardown {Item.delete_all; User.delete_all}

  it "has an initial state in the model" do
    i = Item.new
    i.state.must_equal "pending"
    i.button_press
    i.state.must_equal "completed"
  end

  it "transitions from pending to won't_do" do
    @item.state.must_equal "pending"
    @item.button_reject
    @item.state.must_equal "wont_do"
  end

  it "transitions from wont_do to pending" do 
    i = (Item.create! title: "test", description: "this is a test", state: "wont_do")
    i.state.must_equal "wont_do"
    i.state_event = :pending
    i.state_event.must_equal :pending
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
end
