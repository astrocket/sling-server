class UserSerializer < ActiveModel::Serializer
  def attributes(*args)
    if defined?(current_user) && object == current_user
      object.attributes.symbolize_keys.except(:encrypted_password)
    else
      object.attributes.symbolize_keys.except(:encrypted_password, :authentication_token, :reset_password_token, :reset_password_sent_at)
    end
  end

  has_one :user_detail

end
