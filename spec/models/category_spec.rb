require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'has many' do
    should have_many(:subcategories)
  end
end
