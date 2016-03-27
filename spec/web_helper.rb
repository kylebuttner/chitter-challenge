def sign_up(name, email, password, password_confirmation, username)
  visit 'users/new'
  expect(page.status_code).to eq 200
  fill_in :name, with: name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  fill_in :username, with: username
  click_button 'Sign up'
end
