feature 'User sign in' do

  before do
    @user = create_user
  end

  scenario 'with correct credentials' do
    sign_in(email: @user.email,   password: @user.password_digest)
    expect(page).to have_content "Welcome #{@user.first_name}"
  end

end
