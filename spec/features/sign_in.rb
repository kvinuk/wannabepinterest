require "rails_helper"

describe "The Sign In process", :type => :feature , :js => true do

  before do
    @user = FactoryGirl.create(:user)
  end

  it "signs in the user" do
    visit "users/sign_in"
    fill_in "user[email]", with: @user.email
    fill_in "user[password]", with: "su$eppm01"
    click_on "Log in"

    expect(page).to have_content 'Log out'
  end
end
