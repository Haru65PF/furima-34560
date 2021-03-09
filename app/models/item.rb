class Item < ApplicationRecord
  belongs_to :user
  has_one :item_record
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_date
  belongs_to :delivery_pay
  belongs_to :prefecture

  
  validates :name,              presence: true
  validates :info,              presence: true
  validates :category_id,       numericality: { other_than: 1 }
  validates :condition_id,      numericality: { other_than: 1 }
  validates :delivery_pay_id,   numericality: { other_than: 1 }
  validates :prefecture_id,     numericality: { other_than: 1 }
  validates :delivery_date_id,  numericality: { other_than: 1 }
  validates :price, presence: true, numericality: { in: 300..99999999 }
  

end
