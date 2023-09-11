require 'rails_helper'

RSpec.describe 'index page', type: :system do
  before(:each) do
    @user = User.create(name: 'Sahalu', posts_counter: 0)

    @post1 = @user.posts.create(title: 'Sample Post Title', text: 'Sample Post Content', likes_counter: 0, comments_counter: 0)
    @post2 = @user.posts.create(title: 'Sample Post Title', text: 'Sample Post Content', likes_counter: 0, comments_counter: 0)

    Comment.create(post: @post1, author: @user, text: 'Sample Post Comment')
    Like.create(post: @post1, author: @user)
  end

  describe 'displays user information:' do
    before { visit user_posts_path(@user) }
    
    it 'show profile picture of user' do
      expect(page).to have_content(@user.photo)
    end

    it 'show the name of user' do
      expect(page).to have_content(@user.name)
    end

    it 'show number of posts of user' do
      expect(page).to have_content(@user.posts_counter)
    end
  end

  describe 'displays all user posts' do
    before { visit user_posts_path(@user) }

    it 'shows all elements of a post' do
      [@post1, @post2].each do |post|
        expect(page).to have_content(post.title)
      end
    end
  end
end
