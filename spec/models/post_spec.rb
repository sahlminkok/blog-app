require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.new(title: 'Ruby on Rails',
             text: 'Learning RoR is a bit hard, but with great mindset you can overcome the difficulties and understan',
             author: User.create(name: 'Sahalu'))
  end
  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should not be more than 250 characters' do
    subject.title = 'this is a title that should be more than two hundred and fifty words, I guess its not enough still,
    lets add lorem ipsum, Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
    labore et dolore magna aliqua.'
    expect(subject).to_not be_valid
  end

  it 'comments counter should be an integer' do
    subject.comments_counter = 'not an integer'
    expect(subject).to_not be_valid
  end

  it 'comments counter should be greater than or equal to 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes counter should be an integer' do
    subject.likes_counter = 'not an integer'
    expect(subject).to_not be_valid
  end

  it 'likes counter should be greater than or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end
end
