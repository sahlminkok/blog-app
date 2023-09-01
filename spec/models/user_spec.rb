require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Sahalu', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 0) }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts counter should be an integer' do
    subject.posts_counter = 'not an integer'
    expect(subject).to_not be_valid
  end

  it 'posts counter should be greater than or equal to zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  describe '#three_most_recent_posts' do
    it 'should return three most recent posts of a user' do
      Post.create(title: 'RoR', author: subject, created_at: 4.days.ago, likes_counter: 0, comments_counter: 0)
      post2 = Post.create(title: 'RoR', author: subject, created_at: 3.days.ago, likes_counter: 0, comments_counter: 0)
      post3 = Post.create(title: 'RoR', author: subject, created_at: 2.days.ago, likes_counter: 0, comments_counter: 0)
      post4 = Post.create(title: 'RoR', author: subject, created_at: 1.day.ago, likes_counter: 0, comments_counter: 0)

      expected_order = [post4, post3, post2]

      expect(subject.three_most_recent_posts).to eq(expected_order)
    end
  end
end
