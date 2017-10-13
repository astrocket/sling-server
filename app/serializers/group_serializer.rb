class GroupSerializer < ActiveModel::Serializer

  def attributes(*args)
    object.attributes
  end

  has_one :group_detail
  has_one :manager

end
