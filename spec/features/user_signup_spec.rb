feature 'User Sign Up' do
  scenario 'I can sign up as a new user' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome Vanisthe')
    expect(User.first.email).to eq('vanisthebest@example.com')
  end
end
