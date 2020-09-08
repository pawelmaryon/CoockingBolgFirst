class Portfolio < ApplicationRecord
  include Placeholder

  has_many :cousines
  accepts_nested_attributes_for :cousines,
                                reject_if: lambda { |attribute| attribute[:name].blank? }
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
  
  #callback function setting default picture
  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height:600, width:400)
    self.thumb_image ||= Placeholder.image_generator(height:350, width:200)
  end
  # def set_defaults
  #   if self.main_image == nil
  #     self.main_image = "https://via.placeholder.com/600x400.png"    
  #   if self.thumb_image == nil
  #     self.thumb_image = "https://via.placeholder.com/350x200.png"
  # end
end
