class Category < ApplicationRecord
  validates :title, presence: true, length: {minimum: 4}
  validates :desc, presence: true, length: {minimum: 4}

  has_many :subcategories, dependent: :destroy
end
