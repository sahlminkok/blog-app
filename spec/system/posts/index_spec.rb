require 'rails_helper'

RSpec.describe 'index page', type: :system do
  let!(:user) { User.create(name: 'Sahalu', posts_counter: 0) }

  before do
    visit user_posts_path(user)
  end

  describe 'displays user information:' do
    it 'show profile picture of user' do
      expect(page).to have_content(user.photo)
    end

    it 'show the name of user' do
      expect(page).to have_content(user.name)
    end
  end
end