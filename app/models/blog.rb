class Blog < ApplicationRecord
  enum status: {draft: 0, published: 1}
  extend FriendlyId
  friendly_id :title, use: :slugged  # changed :name to :title

  # Internal Rails Method
  validates_presence_of :title, :body

  # Relationship
  belongs_to :topic

  def self.special_blogs
    all
  end

  def self.feature_blogs
    limit(2)
  end

end