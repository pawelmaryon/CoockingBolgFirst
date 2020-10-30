class Portfolio < ApplicationRecord
  has_many :cousines, dependent: :delete_all
  accepts_nested_attributes_for :cousines,
                                reject_if: lambda { |attribute| attribute[:name].blank? }
  validates :title, presence: true
  validates :body, presence: true

  mount_uploader :main_image, PortfolioUploader
  mount_uploader :thumb_image, PortfolioUploader
  extend FriendlyId
  friendly_id :title, use: :slugged

  scope :soya, -> {where(description: 'Chickory')}
  #another way to implement custom scopes is:
  def self.cheese
    where(description: "Camembert")
  end
  
end
