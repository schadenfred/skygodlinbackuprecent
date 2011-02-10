require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end

  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "Contact")
  end

  it "should have an About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "About")
  end

  it "should have a Help page at '/help'" do
    get '/help'
    response.should have_selector('title', :content => "Help")
  end

  it "should have a Privacy Policy at '/privacy'" do
    get '/privacy'
    response.should have_selector('title', :content => "Privacy Policy")
  end

  it "should have a Terms of Use at '/terms'" do
    get '/terms'
    response.should have_selector('title', :content => "Terms of Use")
  end

  it "should have a signup page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Sign up")
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    response.should have_selector('title', :content => "About")
    click_link "Help"
    response.should have_selector('title', :content => "Help")
    click_link "Terms of Use"
    response.should have_selector('title', :content => "Terms of Use")
    click_link "Privacy Policy"
    response.should have_selector('title', :content => "Privacy Policy")
    click_link "Home"
    response.should have_selector('title', :content => "Home")
    click_link "Contact"
    response.should have_selector('title', :content => "Contact")
  end
end

