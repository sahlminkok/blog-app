require 'rails_helper'

describe 'GET /index' do
  it 'returns a successfull response' do
    get '/users'
    expect(response).to have_http_status(200)
  end

  it 'renders correct template' do
    get '/users'
    expect(response).to render_template('users/index')
  end

  it 'displays a list of users' do
    get '/users'
    expect(response.body).to include('This is Users Index')
  end
end
