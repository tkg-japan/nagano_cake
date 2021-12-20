class Item < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  belongs_to :genre
  attachment :image

      # 消費税を加えた商品価格
    def add_tax_price
        (self.price * 1.08).round
    end

end
