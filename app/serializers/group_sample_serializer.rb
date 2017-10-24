class GroupSampleSerializer < ActiveModel::Serializer

  def attributes(*args)
    object.attributes.merge(
        {
            "paid" => paid_group, # boolean : default false if not paid
            "users_list" => group_users
        }
    )
  end

  has_one :group_detail
  has_one :manager
  has_many :activities, serializer: ActivitySerializer
  # 글들이나 이미지는 보여주지 않거나 제한해서 보여준다

  def paid_group
    grouping = Grouping.where(group: object, user: current_user).take
    if grouping
      grouping.paid
    else
      false
    end
  end

  def group_users
    object.users_list
  end

end
