class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :base_last_name, presence: true
  validates :base_first_name, presence: true
  validates :birth_date, presence: true

  has_many :items
  has_many :item_records
end
