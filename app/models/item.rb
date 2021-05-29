class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :category_id, :charge_id, :prefecture_id, :span_id, :status_id, numericality: { other_than: 1 }
  validates :product, :text, :image, :price, presence: true
  validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :span
  belongs_to :status
end
