class WebPurchase < ApplicationRecord
  after_create :purchase_done

  belongs_to :web_product
  belongs_to :user

  private

    def purchase_done
      product = self.web_product.product
      if product.class.name == 'Group'
        product.users << self.user
      elsif product.class.name == 'Spot'
        product.users << self.user
      end
    end

end
