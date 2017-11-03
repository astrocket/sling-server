class ActivityUnitSerializer < ActiveModel::Serializer
  def attributes(*args)
    object.attributes.merge(
        {
            "full" => check_full,
            "users_list" => activity_users
        }
    )
  end

  has_one :activity_detail
  has_one :group

  def check_full
    object.full?
  end

  def activity_users
    object.users_list
  end

end
