class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :f_name, presence: true
  validates :l_name, presence: true
  validates :f_name_kana, presence: true
  validates :l_name_kana, presence: true
  validates :birthday, presence: true
  validates :password,:password_confirmation, format:{with: /\A(?=.*?[a-z])[a-z\d]+\z/}

end
