require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(author: User.create(name: 'Sahalu'), post: Post.create(title: 'Ruby on Rails')) }
  before {subject.save}

  it 'increments post likes counter' do
    expect { subject.update_comments_counter }.to change { subject.post.comments_counter }.by(1)
  end
end