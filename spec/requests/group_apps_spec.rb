require 'spec_helper'
#Coded by Jack and Nabi
describe "Group App" do

  let(:base_title) { "ChatterBox" }
  
  subject { page }

  describe "Home page" do
    before { visit root_path } 

    it { should have_selector('h1', text: 'Welcome!') }
    it { should have_selector 'title',
                        text: "ChatterBox | Home" }
  end
  
  
  describe "Help page" do
    before { visit '/help' } 
	
	
    it { should have_selector('h1', text: 'Help') }
    it { should have_selector 'title',
                        text: "ChatterBox | Help" }
  end
  
  describe "About page" do
    before { visit '/about' } 
	
	
    it { should have_selector('h1', text: 'About') }
    it { should have_selector 'title',
                        text: "ChatterBox | About" }
  end

    describe "Contact page" do
    before { visit '/contact' } 
	
	
    it { should have_selector('h1', text: 'Contact Us') }
    it { should have_selector 'title',
                        text: "ChatterBox | Contact Us" }
  end
 
end