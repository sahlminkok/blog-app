require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Sahalu', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: "My name is Sahalu Aminu, and I'm a Software Developer") }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
