require 'rails_helper'

RSpec.describe ArticlesController, type: :request do
  describe 'GET /articles' do
    it 'returns index response' do
      get articles_path
      expect(response).to be_successful
    end
    it 'has a 200 status code' do
      get articles_path
      expect(response.status).to eq(200)
    end
  end

  describe 'GET articles/new' do
    it 'should be successful' do
      get articles_new_path
      expect(response).to be_successful
    end
  end
end
