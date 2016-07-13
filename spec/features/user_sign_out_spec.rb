feature 'User sign out' do

  before do
    @user = create_user
  end

  scenario 'with correct credentials' do
    sign_in(
      email: @user.email,
      password: @user.password_digest)
    click_button :'Sign Out'
    expect(page).to have_content 'Goodbye!'
  end

end
