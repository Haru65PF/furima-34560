class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,}\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :base_last_name, presence: true
  validates :base_first_name, presence: true
  validates :birth_date, presence: true

  has_many :items
  has_many :item_records
end
