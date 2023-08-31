require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Sahalu', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: "My name is Sahalu Aminu, and I'm a Software Developer") }
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
end
