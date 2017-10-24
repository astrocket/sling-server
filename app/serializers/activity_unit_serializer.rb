class ActivityUnitSerializer < ActiveModel::Serializer
  def attributes(*args)
    object.attributes.merge(
        {
            "users_list" => activity_users
        }
    )
  end

  has_one :activity_detail
  has_one :group
  has_many :users, serializer: UserSerializer

  def activity_users
    object.users_list
  end

end
