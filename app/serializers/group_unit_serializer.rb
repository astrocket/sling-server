class GroupUnitSerializer < ActiveModel::Serializer

  def attributes(*args)
    object.attributes
  end

  has_one :group_detail
  has_one :manager
  has_many :activities, serializer: ActivitySerializer
  has_many :users, serializer: UserSerializer

end
