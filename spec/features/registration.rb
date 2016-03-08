require "rails_helper"

describe "The registration process", :type => :feature do

	it "register the user" do
		visit "/users/sign_up"
		fill_in "user[name]", with: "Kevin Muro"
		fill_in "user[username]", with: "kvinuk"
		fill_in "user[email]", with: "a@a.com"
		fill_in "user[password]", with: "12345678"
		fill_in "user[password_confirmation]", with: "12345678"
		click_on "Sign up"
		expect(page).to have_content "Log out"

	end

	it "does tnot register the user, due to missing username" do
		visit "/users/sign_up"
		fill_in "user[name]", with: "Kevin Muro"
		fill_in "user[email]", with: "a@a.com"
		fill_in "user[password]", with: "12345678"
		fill_in "user[password_confirmation]", with: "12345678"
		click_on "Sign up"
		expect(page).to have_content "Username can't be blank"

	end


end