class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :manicipality, :address, :building, :phone, :item_id, :user_id, :token

  with_options presence: true do
    validates :user_id, :item_id, :manicipality, :address, :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :phone, format: { with: /\A[0-9]{11}\z/ }
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    # 購入情報を保存し
    order = Order.create(user_id: user_id, item_id: item_id)
    # 配送先を保存する
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, manicipality: manicipality, address: address,
                   building: building, phone: phone, order_id: order.id)
  end
end
