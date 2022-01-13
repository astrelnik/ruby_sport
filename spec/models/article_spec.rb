require 'rails_helper'

RSpec.describe Article, type: :model do
  subject {
    described_class.new(
      title: 'Some article',
      desc: 'Lorem ipsum',
      published_at: DateTime.now,
      category_id: 1
    )
  }
  it 'creates article' do
    expect(subject).to be_valid
  end
end
