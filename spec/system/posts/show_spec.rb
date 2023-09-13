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
      @posts << Post.create(author: @user, title: "Title #{p}", text: "Post #{p} message", comments_counter: 0, likes_counter: 0)
    end
    @posts.each do |p|
      (1..'123456789'.chars.sample(7).sample.to_i).each do |c|
        u = @users.sample(6).sample
        Comment.create(author: u, text: "This is comment #{c}, by #{u.name}", post: p)
      end
    end
    @posts.each do |p|
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
end
