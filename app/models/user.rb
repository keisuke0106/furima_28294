class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, uniqueness: true, format: {with: VALID_EMAIL_REGEX}

    VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
      validates :first_name
      validates :family_name
      validates :first_name_kana
      validates :family_name_kana, format: {with: VALID_NAME_REGEX}

    VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i.freeze
    validates :password, format: { with: VALID_PASSWORD_REGEX }
  end
end
