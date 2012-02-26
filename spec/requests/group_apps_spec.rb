require 'spec_helper'

describe "Group App" do

  describe "Home Page" do

    it "should have the content 'Group App'" do
      visit '/group_app/home'
      page.should have_content('Group App')
    end
  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/group_app/help'
      page.should have_content('Help')
    end
  end

  describe "About page" do

    it "should have the content 'About Us'" do
      visit '/group_app/about'
      page.should have_content('About Us')
    end
  end
end