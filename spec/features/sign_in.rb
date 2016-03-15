require "rails_helper"

describe "The Sign In process", :type => :feature , :js => true do

  before do
    @user = FactoryGirl.create(:user)
  end

  it "signs in the user" do
    sign_in @user

    expect(page).to have_content 'Log out'
  end
end
