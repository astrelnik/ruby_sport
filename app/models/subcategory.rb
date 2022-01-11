class Subcategory < ApplicationRecord
  belongs_to :category
  delegate :title, to: :category, prefix: true
end
