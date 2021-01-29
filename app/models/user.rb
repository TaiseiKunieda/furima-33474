class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i}
  validates :nickname, presence: true
  validates :first_name_J, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :last_name_J, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name_K, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :last_name_K, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :birthday, presence: true
end
