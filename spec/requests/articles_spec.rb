require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  describe 'GET /articles' do
    it 'returns a successful articles response' do
      get articles_path
      expect(response).to be_successful
    end
  end
end
