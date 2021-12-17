class Genre < ApplicationRecord
  has_many :ites, dependent: :destroy
end
