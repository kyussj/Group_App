require 'spec_helper'
#Coded by Jack and Paul
describe "User pages" do

  subject { page }

 describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1',    text: user.name) }
    it { should have_selector('title', text: user.name) }
  end

  describe "signup" do

    before { visit signup_path }

    describe "with non-legit info" do
      it "should not create a user" do
        expect { click_button "Sign up" }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "password"
        fill_in "Confirmation", with: "password"
      end

      it "should create a user" do
        expect { click_button "Sign up" }.to change(User, :count).by(1)
      end
    end
  end
  
    describe "signup" do

    before { visit signup_path }
      describe "error messages" do
        before { click_button "Sign up" }

        let(:error) { 'errors prohibited this user from being saved' }

        it { should have_selector('title', text: 'Sign up') }
        it { should have_content(error) }
    end
  end
end