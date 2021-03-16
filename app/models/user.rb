class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,}\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
  validates :nickname, presence: true

  with_options presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: {with: /\A[ァ-ヶ]+\z/, message: '全角カタカナを使用してください' } do
    validates :base_last_name
    validates :base_first_name
  end

  validates :birth_date, presence: true

  has_many :items
  has_many :itemrecords
end
