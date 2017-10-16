class SpotSerializer < ActiveModel::Serializer

  def attributes(*args)
    object.attributes
  end

  has_one :spot_detail
  has_one :organizer

end
