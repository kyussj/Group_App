# == Schema Information
#
# Table name: users
#
# id :integer not null, primary key
# name :string(255)
# email :string(255)
# created_at :datetime not null
# updated_at :datetime not null
#

require 'spec_helper'
#Coded by Paul, Jack and Nabi
describe User do

  before do
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "discos", password_confirmation: "discos")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:postings) }
  it { should respond_to(:feed) }
  
   describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
    end

  describe "when password does not match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
    end
  
  describe "when name is not entered" do
    before { @user.name = " " }
    it { should_not be_valid }
    end

  describe "when email is not entered" do
    before { @user.email = " " }
    it { should_not be_valid }
	end

  describe "when name is faaaaaaaaar too long" do
    before { @user.name = "a" * 70 }
    it { should_not be_valid }
    end
 
  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
	  user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
	it { should_not be_valid }
    end
  
   describe "when email format is incorrect" do
    invalid_addresses = %w[user@fake,com user_at_fake.org example.user@fake.]
    invalid_addresses.each do |invalid_address|
      before { @user.email = invalid_address }
      it { should_not be_valid }
    end
  end
 
  describe "when some fool enters a password that is not present" do
  before { @user.password = @user.password_confirmation = " " }
  it { should_not be_valid }
  end

  describe "with a password that's too shrt" do
    before { @user.password = @user.password_confirmation = "a" * 3 }
    it { should be_invalid }
  end

  describe "when password does not match the confirmation" do
  before { @user.password_confirmation = "mismatch" }
  it { should_not be_valid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }
  end
  
  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end
  
  describe "Posting associations" do
before { @user.save }
    let!(:older_posting) do
      FactoryGirl.create(:posting, user: @user, created_at: 1.day.ago)
  end
    let!(:newer_posting) do
      FactoryGirl.create(:posting, user: @user, created_at: 1.hour.ago)
  end

  it "should have the right postings in the right order" do
      @user.postings.should == [newer_posting, older_posting]
  end

  it "should destroy associated postings" do
      postings = @user.postings
      @user.destroy
      postings.each do |posting|
        Posting.find_by_id(posting.id).should be_nil
      end
    end
  end
   
  describe "posting associations" do

    before { @user.save }
    let!(:older_posting) do 
      FactoryGirl.create(:posting, user: @user, created_at: 1.day.ago)
   end
	
   let!(:newer_posting) do
      FactoryGirl.create(:posting, user: @user, created_at: 1.hour.ago)
   end

   describe "status" do
      let(:unfollowed_post) do
        FactoryGirl.create(:posting, user: FactoryGirl.create(:user))
    end

      its(:feed) { should include(newer_posting) }
      its(:feed) { should include(older_posting) }
      its(:feed) { should_not include(unfollowed_post) }
    end
  end
end
