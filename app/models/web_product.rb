class WebProduct < ApplicationRecord
  before_create :set_product_name
  belongs_to :group
  has_many :web_purchases

  private

    def set_product_name
      name = '슬링 결제 상품'
      name = self.group.group_detail.name if self.group.present?
      # name = self.spot.spot_detail.name if self.spot.present?

      self.name = name
    end

end
