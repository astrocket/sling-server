class PostSerializer < ActiveModel::Serializer

  def attributes(*args)
    object.attributes
  end

  has_one :user, serializer: UserSerializer

end
