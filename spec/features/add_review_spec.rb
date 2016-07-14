
feature 'Adding a Review' do

  before do
    @user1 = create_user
  end

  scenario 'user can add a review to a restaurant' do
    user2 = User.create(
      first_name: 'Oliisthe',
      last_name: 'Worst',
      email: 'o@example.com',
      password_digest: '12345678'
    )

    Restaurant.create(
      name: 'Chicken Shop',
      description: 'chicken',
      user_id: user2.id
    )

    sign_in(
      email: @user1.email,
      password: @user1.password_digest
    )

    within '#restaurants tr:first-child' do
      click_link 'Show'
    end

    click_link 'New Review'
    fill_in :'review[description]', with: 'A nice place to eat'
    fill_in :'review[rating]', with: 5
    click_button 'Create Review'
    expect(page).to have_content 'Review was successfully created.'
  end


  scenario 'user cannot add a review to their own restaurant' do
    Restaurant.create(
      name: 'Chicken Shop',
      description: 'chicken',
      user_id: @user1.id
    )

    sign_in(
      email: @user1.email,
      password: @user1.password_digest
    )

    within '#restaurants tr:first-child' do
      click_link 'Show'
    end
    expect(page).not_to have_content('Add Review')

  end

end
