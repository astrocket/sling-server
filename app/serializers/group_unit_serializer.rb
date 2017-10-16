class GroupUnitSerializer < ActiveModel::Serializer

  def attributes(*args)
    object.attributes
  end

  has_one :group_detail
  has_one :manager
  has_many :activities, serializer: ActivitySerializer
  has_many :users, serializer: UserSerializer
  # 여기선 글들, 이미지들 까지 싹 보여진다

end
