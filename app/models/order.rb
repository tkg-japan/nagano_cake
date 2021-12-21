class Order < ApplicationRecord

  has_many :order_details, dependent: :destroy
  belongs_to :customer
  enum payment_method: { credit_card: 0, transfer: 1}
  # 0が入っている場合は credit_card  1が入ってる場合はtransfer(銀行振込)


end
