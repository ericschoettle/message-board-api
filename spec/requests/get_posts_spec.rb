require 'rails_helper'

describe "get all posts route", :type => :request do
  let!(:posts) { FactoryGirl.create_list(:post, 20)}

  before { get '/posts' }

  it 'returns all posts' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end