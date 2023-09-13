require 'rails_helper'

RSpec.describe 'User page [users#show]', type: :system do
  before(:all) do
    john_bio = ['This is the user bio.', 'it has', 'several', 'rows']
    @user = User.create(name: 'John Doe', photo: 'https://plchldr.co/i/75?bg=252f3f&fc=ffffff&text=john',
                        bio: john_bio.join(' '), posts_counter: 0)
    %w[post1 post2 post3 post4 post5].each { |p| Post.create(author: @user, title: p, text: "#{p} message") }
  end

  describe '* shows user\'s info like:' do
    it '- the user name' do
      visit user_path(@user)
      expect(page).to have_content(@user.name)
    end

    it '- the user\'s profile picture' do
      visit user_path(@user)
      sleep(1)
      expect(page).to have_css("img[src*='#{@user.photo}']")
    end
  end
end
