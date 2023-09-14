require 'rails_helper'

RSpec.describe 'Posts Index Page', type: :system do
  before(:each) do
    @user = User.create(name: 'Sahalu', posts_counter: 0)

    @post1 = @user.posts.create(title: 'Sample Post Title', text: 'Sample Post Content', likes_counter: 0,
                                comments_counter: 0)
    @post2 = @user.posts.create(title: 'Sample Post Title', text: 'Sample Post Content', likes_counter: 0,
                                comments_counter: 0)

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
        expect(page).to have_content("Comments: #{post.comments_counter}")
        expect(page).to have_content("Likes: #{post.likes_counter}")
      end
    end

    it 'shows the first comment on a post' do
      expect(page).to have_content(@post2.comments.first)
    end
  end

  describe 'links attached to the page' do
    before { visit user_posts_path(@user) }

    it 'redirects to the post show page when clicking on a post' do
      post = @post1
      find("a[href='#{user_post_path(@user, post)}']").click
      expect(page).to have_current_path(user_post_path(@user, post))
    end

    it 'redirects to create new post when clicking on create_a_post button' do
      click_link 'Create a Post'
      expect(page).to have_current_path(new_user_post_path(@user, @posts))
    end

    it 'redirects to the user show page when clicking on back button' do
      click_link 'Back'
      expect(page).to have_current_path(user_path(@user))
    end
  end
end
