class WebPurchase < ApplicationRecord
  after_create :purchase_done

  belongs_to :web_product
  belongs_to :user

  private

    def purchase_done
      product = self.web_product.product
      if product.class.name == 'Group'
        product.users << self.user unless product.users.include?(self.user)
        product.save
        grouping = Grouping.where(group: product, user: user).take
        grouping.paid = true
        grouping.save
      elsif product.class.name == 'Spot'
        product.users << self.user unless product.users.include?(self.user)
        product.save
        spoting = Spoting.where(spot: product, user: user).take
        spoting.paid = true
        spoting.save
      end
    end

end
