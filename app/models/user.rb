class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :f_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :l_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :f_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :l_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
    validates :password, :password_confirmation, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/}
  end
end
