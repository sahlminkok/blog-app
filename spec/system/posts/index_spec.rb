require 'rails_helper'

RSpec.describe 'index page', type: :system do
  let!(:user) { User.create(name: 'Sahalu', posts_counter: 0) }

  before do
    visit user_posts_path(user)
  end
end