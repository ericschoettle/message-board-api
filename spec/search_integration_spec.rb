require 'rails_helper'  

describe 'search feature', :type => :request do
  let!(:posts) { FactoryGirl.create_list(:post, 100)} 

  before { get '/posts?title=the' }

  it 'allows multiple search parameters' do
    expect(JSON.parse(response.body).length).to eq 20
  end
end