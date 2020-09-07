class Portfolio < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :body, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  scope :soya, -> {where(description: 'Chickory')}
  #another way to implement custom scopes is:
  def self.cheese
    where(description: "Camembert")
  end
  
end
