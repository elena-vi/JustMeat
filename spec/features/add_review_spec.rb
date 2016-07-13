
feature 'Adding a Review' do

  before do
    @user = create_user
    Restaurant.create(name: 'Chicken Shop',
                      description: 'chicken',
                      user_id: @user.id)
    sign_in(
      email: @user.email,
      password: @user.password_digest)
  end

  scenario 'user can add a review to a restaurant' do
      within '#restaurants tr:first-child' do
        click_link 'Show'
      end
      click_link 'Add Review'
      fill_in :description, with: 'A nice place to eat'
      choose('5')
      click_button 'Submit'
      expect(page).to have_content 'Review Submitted!'
  end

end
