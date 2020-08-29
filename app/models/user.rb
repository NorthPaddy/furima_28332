class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  with_options presence: true do
    validates :nickname
    PASSWORD_REGEX = /\A[a-z\d]{6,}+\z/i.freeze
    validates :password,
              format: { with: PASSWORD_REGEX }
    validates :family_name, :first_name,
              format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :family_name_kana, :first_name_kana,
              format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
  end
end
