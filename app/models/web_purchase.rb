class WebPurchase < ApplicationRecord
  belongs_to :web_product
  belongs_to :user
end
