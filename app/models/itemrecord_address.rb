class ItemrecordAddress
  include ActiveModel::Model
  attr_accessor :post_num, :prefecture_id, :city, :address, :building, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_num, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :address
    validates :phone, format: {with: /\A[0-9]{11}\z/}
    validates :token
  end

  validates :prefecture_id, numericality: {other_than: 1}

  def save
    itemrecord = Itemrecord.create(user_id: user_id, item_id: item_id)
    Address.create(post_num: post_num, prefecture_id: prefecture_id, city: city, address: address, building: building, phone: phone, itemrecord_id: itemrecord.id)
  end
end