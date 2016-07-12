def create_user
  User.create(first_name: 'Vanisthe',
              last_name: 'Best',
              email: 'user@example.com',
              password_digest: 'secret1234'
              )
end

def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign In'
end

def sign_up(
  first_name: 'Vanisthe',
  last_name: 'Best',
  email: 'vanisthebest@example.com',
  password: '12345678',
  password_confirmation: '12345678')

  visit '/users/new'
  fill_in :'user[first_name]', with: first_name
  fill_in :'user[last_name]', with: last_name
  fill_in :'user[email]', with: email
  fill_in :'user[password_digest]', with: password
  click_button 'Sign Up'
end
