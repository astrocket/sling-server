class SlingIamport
  def initialize(user, product, pay_params)
    @user = user
    @product = product
    @pay_params = pay_params
  end

  def approve
    parsed_imp = Iamport.payment(@pay_params[:imp_uid]).parsed_response['response']
    imp = parsed_imp.reject { |key, value| !WebPurchase.attribute_names.include?(key) }

    web_purchase = nil
    if parsed_imp['status'] == 'paid' && @product.price == parsed_imp[:amount]
      web_purchase = @product.web_purchases.new(imp)
      web_purchase.user = @user
      web_purchase.permission = true
      web_purchase.validation = true if parsed_imp['status'] == 'paid' # Iamport API call verification
    end
    web_purchase
  end

  def user
    @user
  end

end
