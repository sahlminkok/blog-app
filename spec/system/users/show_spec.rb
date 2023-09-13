require 'rails_helper'

RSpec.describe 'User page [users#show]', type: :system do
  before(:all) do
    john_bio = ['This is the user bio.', 'it has', 'several', 'rows']
    @user = User.create(name: 'John Doe', photo: 'https://plchldr.co/i/75?bg=252f3f&fc=ffffff&text=john',
                        bio: john_bio.join(' '), posts_counter: 0)
    %w[post1 post2 post3 post4 post5].each do |p|
      Post.create(author: @user, title: p, text: "#{p} message", comments_counter: 0, likes_counter: 0)
    end
  end

  describe '* shows user\'s info like:' do
    before { visit user_path(@user) }

    it '- the user name' do
      expect(page).to have_content(@user.name)
    end

    it '- the user\'s profile picture' do
      expect(page).to have_css("img[src*='#{@user.photo}']")
    end

    it '- the number of posts the user has written' do
      expect(page).to have_content("Number of posts: #{@user.posts_counter}")
    end

    it '- the user\'s bio' do
      expect(page).to have_selector('div h4').and have_content(/Bio/)
      expect(page).to have_selector('div').and have_content(/Bio\n#{@user.bio}/)
    end
  end

  describe '* shows user\'s activity like:' do
    before { visit user_path(@user) }

    it '- the user\'s 3 most recent posts' do
      visit user_path(@user)
      @user.three_most_recent_posts.each do |p|
        expect(page).to have_selector('div div h6').and have_content(/Post ##{p.id}/)
        expect(page).to have_selector('div div h4').and have_content(/#{p.title}/)
      end
    end

    context '- each post displays:' do
      it '> the number of comments' do
        selector = 'div div p'
        @user.three_most_recent_posts.each do |p|
          expect(page).to have_selector(selector).and have_content("Comments: #{p.comments_counter}")
        end
      end

      it '> the number of likes' do
        selector = 'div div p'
        @user.three_most_recent_posts.each do |p|
          expect(page).to have_selector(selector).and have_content("Likes: #{p.likes_counter}")
        end
      end
    end
  end

  describe '* user interactions' do
    before { visit user_path(@user) }

    context '- each post displayed:' do
      it '> is clickable' do
        @user.three_most_recent_posts.each do |p|
          expect(page).to have_css("a[href*='/users/#{@user.id}/posts/#{p.id}']")
        end
      end

      it "> when clicked it opens the 'post' page" do
        @user.three_most_recent_posts.each do |p|
          visit user_path(@user)
          find("a[href*='/users/#{@user.id}/posts/#{p.id}']").click
          expect(page).to have_current_path(user_post_path(@user, p))
        end
      end
    end

    context '- a \'see all posts\' button' do
      it '> is shown at the bottom of the page' do
        expect(page).to have_link('See all posts')
      end
    end
  end
end
