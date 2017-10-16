class WebProduct < ApplicationRecord
  before_create :set_product_name

  belongs_to :product, polymorphic: true
  has_many :web_purchases

  private

    def set_product_name
      name = '슬링 결제 상품'
      parent = self.product
      if parent.class.name == 'Group'
        name = parent.group_detail.name
      elsif parent.class.name == 'Spot'
        name = parent.spot_detail.name
      end
      self.name = name
    end

end
