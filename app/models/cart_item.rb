class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  # 小計を求めるメソッド・カリキュラム参照
  def subtotal
    item.with_tax_price * amount
  end
  
end
