class PostUnitSerializer < ActiveModel::Serializer

  def attributes(*args)
    object.attributes
  end

  has_one :user, serializer: UserSerializer
  has_many :comments, serializer: CommentSerializer

end
