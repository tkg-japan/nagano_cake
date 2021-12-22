class Order < ApplicationRecord

  has_many :order_details, dependent: :destroy
  belongs_to :customer
  enum payment_method: { credit_card: 0, transfer: 1}
  # 0が入っている場合は credit_card  1が入ってる場合はtransfer(銀行振込)

 enum status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}

  def add_tax
    (item.price * 1.08).round
  end
end
