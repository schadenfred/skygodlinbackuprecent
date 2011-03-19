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

  describe "from_users_followed_by" do

    before(:each) do
      @other_user = Factory(:user, :email => Factory.next(:email))
      @third_user = Factory(:user, :email => Factory.next(:email))
      @user_post = @user.reviews.create!(:content => "foo")
      @other_post = @other_user.reviews.create!(:content => "bar")
      @third_post = @third_user.reviews.create!(:content => "baz")
      @user.follow!(@other_user)
    end

    it "should have a from_users_followed_by class method" do
      Review.should respond_to(:from_users_followed_by)
    end

    it "should include the followed user's reviews" do
      Review.from_users_followed_by(@user).should include(@other_post)
    end

    it "should include the user's own reviews" do
      Review.from_users_followed_by(@user).should include(@user_post)
    end

    it "should not include an unfollowed user's reviews" do
      Review.from_users_followed_by(@user).should_not include(@third_post)
    end
  end
end

