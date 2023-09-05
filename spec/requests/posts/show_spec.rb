require 'rails_helper'

describe 'GET /show' do
  let(:user) { User.create(name: 'Sahalu', posts_counter: 0) }
  let(:post) { Post.create(title: 'RoR', author: user, likes_counter: 0, comments_counter: 0) }

  it 'returns a successfull response' do
    get "/users/#{user.id}/posts/#{post.id}"
    expect(response).to have_http_status(200)
  end

  it 'renders correct template' do
    get "/users/#{user.id}/posts/#{post.id}"
    expect(response).to render_template('posts/show')
  end

  it 'displays a post for a user with a given id' do
    get "/users/#{user.id}/posts/#{post.id}"
    expect(response.body).to include('Here is a post for a given user')
  end
end
