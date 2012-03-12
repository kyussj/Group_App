# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'
#Coded by Paul, Jack and Nabi
describe User do

  before do
    @user = User.new(name: "Example User", email: "user@example.com", 
                     password: "disco", password_confirmation: "disco")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:feed) }
  it { should respond_to(:relationships) }
  
   describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
    end

  describe "when password doesn't match confirmation" do
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
    invalid_addresses =  %w[user@fake,com user_at_fake.org example.user@fake.]
    invalid_addresses.each do |invalid_address|
      before { @user.email = invalid_address }
      it { should_not be_valid }
    end
  end
 
  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }
  end
end