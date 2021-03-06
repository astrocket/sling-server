class UserShowSerializer < ActiveModel::Serializer
  def attributes(*args)
    if object == current_user
      object.attributes.symbolize_keys.except(:encrypted_password)
    else
      object.attributes.symbolize_keys.except(:encrypted_password, :authentication_token, :reset_password_token, :reset_password_sent_at)
    end
  end

  has_one :user_detail
  has_many :groups
  has_many :spots

end
