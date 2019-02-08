class Portfolio < ApplicationRecord
  include Placeholder
  
  has_many :technologies
  accepts_nested_attributes_for :technologies, 
                                reject_if: lambda { |attr| attr['name'].blank? }
  
  validates_presence_of :title, :body, :main_image, :thumb_image

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  def self.angular
    where(subtitle: 'Angular')
  end

  def self.by_position
    order("position ASC")  #ASC=Ascending
  end

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400') unless main_image
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200') unless thumb_image
  end
end
