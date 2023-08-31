require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'Ruby on Rails', text: 'Learning RoR is a bit hard, but with great mindset you can overcome the difficulties and understand it', author: User.create(name: 'Sahalu')) }
  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should not be more than 250 characters' do
    subject.title = 'this is a title that should be more than two hundred and fifty words, I guess its not enough still, lets add lorem ipsum, Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum'
    expect(subject).to_not be_valid
  end
end
