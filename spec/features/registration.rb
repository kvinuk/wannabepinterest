require "rails_helper"

describe "the registration process", type: :feature do

  it "register the user" do
    visit "/users/sign_up"
    fill_in "user[name]", with: "Abraham Kuri"
    fill_in "user[username]", with: "kurenn"
    fill_in "user[email]", with: "kurenn@icalialabs.com"
    fill_in "user[password]", with: "12345678"
    fill_in "user[password_confirmation]", with: "12345678"
    click_on "Sign up"
    expect(page).to have_content 'Log out'
  end

  it "does not register the user, due to missing username" do
    visit "/users/sign_up"
    fill_in "user[name]", with: "Abraham Kuri"
    fill_in "user[email]", with: "kurenn@icalialabs.com"
    fill_in "user[password]", with: "12345678"
    fill_in "user[password_confirmation]", with: "12345678"
    click_on "Sign up"
    expect(page).to have_content "Username can't be blank"
  end

end
