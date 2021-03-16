class Item < ApplicationRecord
  belongs_to :user
  has_one :itemrecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_date
  belongs_to :delivery_pay
  belongs_to :prefecture

  with_options presence: true do
    validates :name
    validates :info
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_pay_id
    validates :prefecture_id
    validates :delivery_date_id
  end
  
  

end
