class GroupSampleSerializer < ActiveModel::Serializer

  def attributes(*args)
    object.attributes
  end

  has_one :group_detail
  has_one :manager
  has_many :activities, serializer: ActivitySerializer
  has_many :users, serializer: UserSerializer
  # 글들이나 이미지는 보여주지 않거나 제한해서 보여준다
end
