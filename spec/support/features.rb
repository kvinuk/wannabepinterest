def sign_in(user)
  visit "/users/sign_in"
  fill_in "user[email]", with: user.email
  fill_in "user[password]", with: "12345678"
  click_button "Log in"
end
