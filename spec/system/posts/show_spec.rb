require 'rails_helper'

RSpec.describe 'Post page [posts#show]', type: :system do
  before(:all) do
    qty = %w[1 2 3 4 5 6 7 8]
    john_bio = ['This is the user bio.', 'it has', 'several', 'rows']
    @user = User.create(name: 'John Doe', photo: 'https://plchldr.co/i/75?bg=252f3f&fc=ffffff&text=john',
                        bio: john_bio.join(' '), posts_counter: 0)
    @users = []
    qty.each do |u|
      @users << User.create(name: "user #{u}", photo: "https://plchldr.co/i/75?bg=252f3f&fc=ffffff&text=user-#{u}",
                            bio: "This is the user #{u} bio.", posts_counter: 0)
    end
    @posts = []
    qty.each do |p|
      @posts << Post.create(author: @user, title: "Title #{p}", text: "Post #{p} message", comments_counter: 0,
                            likes_counter: 0)
    end
    @posts.each do |p|
      (1..'123456789'.chars.sample(7).sample.to_i).each do |c|
        u = @users.sample(6).sample
        Comment.create(author: u, text: "This is comment #{c}, by #{u.name}", post: p)
      end
      (1..'123456'.chars.sample(5).sample.to_i).each do |_c|
        u = @users.sample(5).sample
        Like.create(author: u, post: p)
      end
    end
    @post = @posts.sample(4).sample
  end

  describe '* shows full post\'s info like:' do
    before { visit user_post_path(@user, @post) }

    it '- the post title' do
      within('div div h3') { expect(page).to have_content(@post.title) }
    end

    it '- the post message' do
      within('div div h4') { expect(page).to have_content(@post.text) }
    end

    it '- the post number(id)' do
      within('div div h6') { expect(page).to have_content(/Post ##{@post.id}/) }
    end

    it '- the post\'s author' do
      within('div div h6') { expect(page).to have_content(/by #{@user.name}/) }
    end

    it '- the number of comments' do
      within('div div div p') { expect(page).to have_content(/Comments: #{@post.comments_counter}/) }
    end

    it '- the number of likes' do
      within('div div div p') { expect(page).to have_content(/Likes: #{@post.likes_counter}/) }
    end
  end

  describe '* if the post has comments:' do
    before { visit user_post_path(@user, @post) }

    it '- shows the full list of comments' do
      within('div.comments') { expect(page.all('p').count).to be(@post.comments_counter) }
    end

    context '- each of the comments' do
      it '- has an author' do
        @post.comments.each do |c|
          within('div.comments') { expect(page).to have_content(/#{c.author.name}:/) }
        end
      end

      it '- has a message/text' do
        @post.comments.each do |c|
          within('div.comments') { expect(page).to have_content(/: #{c.text}/) }
        end
      end
    end
  end

  describe '* user interactions' do
    before { visit user_post_path(@user, @post) }

    context '- an \'add a comment\' button:' do
      it '> is displayed at the bottom of the page ' do
        expect(page).to have_link('Add a comment')
      end

      it '> when clicked, opens the \'new comment\' page' do
        click_on('Add a comment')
        expect(page).to have_current_path(new_user_post_comment_path(User.first, @post))
      end
    end

    context '- a \'like\' button:' do
      it '> is displayed at the bottom of the page ' do
        expect(page).to have_button('Like')
      end

      it '> when clicked, increases by 1 the number of likes' do
        click_on('Like')
        within('div div div p') { expect(page).to have_content(/Likes: #{@post.likes_counter_was + 1}/) }
      end

      it '> the \'post\' page is still the current page' do
        click_on('Like')
        expect(page).to have_current_path(user_post_path(@user, @post))
      end
    end

    context '- a \'back\' button:' do
      it '> is displayed at the bottom of the page ' do
        expect(page).to have_link('Back')
      end

      it '> when clicked, it opens the user\'s \'all posts\' page' do
        click_on('Back')
        expect(page).to have_current_path(user_posts_path(@user))
      end
    end
  end
end
