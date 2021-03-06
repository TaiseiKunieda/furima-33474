class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :purchases
  
  with_options presence: true do
    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i}
    validates :nickname
    validates :first_name_J, format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :last_name_J, format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :first_name_K, format: {with: /\A[ァ-ヶー－]+\z/}
    validates :last_name_K, format: {with: /\A[ァ-ヶー－]+\z/}
    validates :birthday
  end
end
