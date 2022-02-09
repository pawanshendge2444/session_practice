class User < ApplicationRecord
  has_secure_password
  
  validates :username, presence: true
  validates :password, length: { minimum: 6 }

  has_many :likes, dependent: :destroy

  has_one :cart, dependent: :destroy

  has_many :products, dependent: :destroy
  has_many :comments, :as => :commentable, dependent: :destroy


  after_create :initialize_cart

  def initialize_cart
    Cart.create(user_id:id )
  end
  
end
