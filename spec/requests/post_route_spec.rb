require 'rails_helper'

describe "post a post route", :type => :request do

  before do
    post '/posts', params: { :author => 'test_author', :title => "test_title", :content => 'test_content' }
  end

  it 'returns the author' do
    expect(JSON.parse(response.body)['author']).to eq('test_author')
  end

  it 'returns the title' do
    expect(JSON.parse(response.body)['title']).to eq('test_title')
  end

  it 'returns the content' do
    expect(JSON.parse(response.body)['content']).to eq('test_content')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end