class Article < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5}
  validates :desc, presence: true, length: {minimum: 5}
end
