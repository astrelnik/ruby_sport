require 'rails_helper'

RSpec.describe Subcategory, type: :model do

  it 'belongs_to' do
    should belong_to :category
  end
end
