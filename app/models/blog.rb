class Blog < ApplicationRecord
  enum status: {draft: 0, published: 1}
  extend FriendlyId
  friendly_id :title, use: :slugged  # changed :name to :title

  # Internal Rails Method
  validates_presence_of :title, :body
end
