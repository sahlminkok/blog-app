require 'rails_helper'

RSpec.describe 'Users Index Page' do
  it 'should display user information' do
    user = User.create(name: 'Sahalu', photo: 'https://placehold.co/200x133', posts_counter: 0)
    user1 = User.create(name: 'Kabir', photo: 'https://placehold.co/200x133', posts_counter: 0)
    user2 = User.create(name: 'Abdullah', photo: 'https://placehold.co/200x133', posts_counter: 0)
    user3 = User.create(name: 'Nasser', photo: 'https://placehold.co/200x133', posts_counter: 0)

    visit users_path

    [user, user1, user2, user3].each do |u|
      expect(page).to have_content(u.name)
      expect(page).to have_css("img[src*='#{u.photo}']")
      expect(page).to have_content("Number of posts: #{u.posts_counter}")
    end
  end

  it "should redirect to user's show page when clicked on a user" do
    user = User.create(name: 'Sahalu', photo: 'https://placehold.co/200x133', posts_counter: 0)

    visit users_path

    find("a[href='/users/#{user.id}']", visible: :all).click
    expect(page).to have_current_path(user_path(user))
  end
end
