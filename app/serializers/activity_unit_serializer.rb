class ActivityUnitSerializer < ActiveModel::Serializer
  def attributes(*args)
    object.attributes
  end

  has_one :activity_detail
  has_one :group
  has_many :users, serializer: UserSerializer

end
