class SpotUnitSerializer < ActiveModel::Serializer

  def attributes(*args)
    object.attributes
  end

  has_one :spot_detail
  has_one :organizer
  has_many :users, serializer: UserSerializer

end
