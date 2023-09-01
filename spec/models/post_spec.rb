require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'RoR', author: User.create(name: 'Sahalu'), comments_counter: 0, likes_counter: 0) }
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

  describe '#update_posts_counter' do
    it 'increments author posts counter' do
      expect { subject.update_posts_counter }.to change { subject.author.posts_counter }.by(1)
    end
  end

  describe '#five_most_recent_comments' do
    it 'should return the five most recent comments of a given post' do
      user = User.create(name: 'Sahalu')

      Comment.create(text: 'comment1', author: user, post: subject, created_at: 5.days.ago)
      comment2 = Comment.create(text: 'comment2', author: user, post: subject, created_at: 4.days.ago)
      comment3 = Comment.create(text: 'comment3', author: user, post: subject, created_at: 3.days.ago)
      comment4 = Comment.create(text: 'comment4', author: user, post: subject, created_at: 2.days.ago)
      comment5 = Comment.create(text: 'comment5', author: user, post: subject, created_at: 1.day.ago)
      comment6 = Comment.create(text: 'comment6', author: user, post: subject, created_at: Time.now)

      expected_order = [comment6, comment5, comment4, comment3, comment2]

      expect(subject.five_most_recent_comments).to eq(expected_order)
    end
  end
end
