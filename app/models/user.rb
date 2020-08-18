class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
      validates :first_name
      validates :family_name
      validates :first_name_kana
      validates :family_name_kana
    end
    VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i.freeze
    validates :password, format: { with: VALID_PASSWORD_REGEX }
  end
end
