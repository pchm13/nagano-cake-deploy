class Item < ApplicationRecord
  belongs_to :type
	has_many :cart_items, dependent: :destroy
  attachment :image

  validates :name, presence: true
  validates :body, presence: true
  validates :price, presence: true
  validates :is_active, inclusion: {in: [true, false]}

  
end
