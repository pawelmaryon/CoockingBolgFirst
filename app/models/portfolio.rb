class Portfolio < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :body, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged
end
