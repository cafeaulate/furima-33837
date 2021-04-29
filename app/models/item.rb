class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :imege
  belongs_to :category 
  belongs_to :charge 
  belongs_to :prefucture 
  belongs_to :span 
  belongs_to :status

  validates :category_id, :charge_id, :prefucture_id, :span_id, :status_id, numericality: {other_than: 1 }





end
