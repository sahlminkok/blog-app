require 'rails_helper'

describe 'GET /show' do
  let(:user) { User.create(name: 'Sahalu', posts_counter: 0) }

  it 'returns a successfull response' do
    get "/users/#{user.id}"
    expect(response).to have_http_status(200)
  end

  it 'renders correct template' do
    get "/users/#{user.id}"
    expect(response).to render_template('users/show')
  end

  it 'displays a user with a given id' do
    get "/users/#{user.id}"
    expect(response.body).to include('Here is a view for each user')
  end
end
