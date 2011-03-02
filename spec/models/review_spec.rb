require 'spec_helper'

describe Review do

  before(:each) do
    @user = Factory(:user)
    @attr = { :content => "value for content" }
  end

  it "should create a new instance given valid attributes" do
    @user.reviews.create!(@attr)
  end

  describe "user associations" do

    before(:each) do
      @review = @user.reviews.create(@attr)
    end

    it "should have a user attribute" do
      @review.should respond_to(:user)
    end

    it "should have the right associated user" do
      @review.user_id.should == @user.id
      @review.user.should == @user
    end
  end

  describe "validations" do

    it "should require a user id" do
      Review.new(@attr).should_not be_valid
    end

    it "should require nonblank content" do
      @user.reviews.build(:content => "  ").should_not be_valid
    end

    it "should reject long content" do
      @user.reviews.build(:content => "a" * 141).should_not be_valid
    end
  end
end

