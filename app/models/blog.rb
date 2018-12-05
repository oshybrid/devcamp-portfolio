class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged  # changed :name to :title
end
