require 'spec_helper'

describe "Group App" do

  let(:base_title) { "Group App" }
  
  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/help'
      page.should have_content('Help')
    end
 
    it "should have the title 'Help'" do
      visit '/help'
      page.should have_selector('title', :text => "#{base_title} | Help")
    end
	end

  
  describe "About page" do

    it "should have the content 'About Us'" do
      visit '/about'
      page.should have_content('About Us')
    end
 
  
    it "should have the title 'About'" do
      visit '/about'
      page.should have_selector('title', :text => "#{base_title} | About")
    end
   end
  
    describe "Contact page" do

    it "should have the h1 'Contact Us'" do
      visit '/contact'
      page.should have_selector('h1', :text => 'Contact Us')
    end
	
	    it "should have the title 'Contact Us'" do
      visit '/contact'
      page.should have_selector('title', :text => "#{base_title} | Contact Us")
    end
   end
end