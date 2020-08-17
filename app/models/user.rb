class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :email,
      uniqueness: true,
      format: { with: /\A\S+@\S+\.\S+\z/, message: "Email can't be blank"}
    validates :password,
      format: { with: /\A[a-z\d]{6,}+\z/i}
    validates :family_name, :first_name,
      format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "name can't be blank"}
    validates :family_name_kana, :first_name_kana,
      format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "First name kana can't be blank"}
    validates :birthday
  end
end
