class Article < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5}
  validates :desc, presence: true, length: {minimum: 5}

  def self.getPublished
    @articles = Article.where.not(published_at: nil)

    return @articles
  end

  def self.removeUnpublished
    @articles = Article.destroy_by(published_at: nil)
  end
end
