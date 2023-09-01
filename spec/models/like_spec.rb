require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { Like.new(author: User.create(name: 'Sahalu'), post: Post.create(title: 'Ruby on Rails')) }
  before { subject.save }

  it 'increments post likes counter' do
    expect { subject.update_likes_counter }.to change { subject.post.likes_counter }.by(1)
  end
end
