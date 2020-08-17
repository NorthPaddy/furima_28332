class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :email,
      uniqueness: true,
      format: { with: /\A\S+@\S+\.\S+\z/}
    validates :password,
      format: { with: /\A[a-z\d]{6,}+\z/i}
    validates :family_name, :first_name,
      format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :family_name_kana, :first_name_kana,
    format: { with: /\A[ァ-ヶー－]+\z/, }
    validates :birthday
  end
end
