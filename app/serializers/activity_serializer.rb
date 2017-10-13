class ActivitySerializer < ActiveModel::Serializer

  def attributes(*args)
    object.attributes
  end

  has_one :activity_detail

end
