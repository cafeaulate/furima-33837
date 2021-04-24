class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :f_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :l_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :f_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :l_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true
  validates :password, :password_confirmation, presence: true, format: { with: /\A(?=.*?[a-zA-z])[a-zA-Z\d]+\z/ }
end
