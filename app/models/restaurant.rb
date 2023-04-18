class Restaurant < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :category

  has_many :product_categories
  has_many :orders
  has_many :ratings

  has_one_attached :image

  validates :name, :delivery_tax, :city, :neighborhood, :street, :number, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[name description]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[category]
  end
end
