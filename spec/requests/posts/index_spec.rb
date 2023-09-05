require 'rails_helper'

describe 'GET /index' do
  let(:user) { User.create(name: 'Sahalu', posts_counter: 0) }

  it 'returns a successfull response' do
    get "/users/#{user.id}/posts"
    expect(response).to have_http_status(200)
  end

  it 'renders correct template' do
    get "/users/#{user.id}/posts"
    expect(response).to render_template('posts/index')
  end

  it 'displays a list of posts for a given id' do
    get "/users/#{user.id}/posts"
    expect(response.body).to include('Here is a list of posts for a given user')
  end
end
