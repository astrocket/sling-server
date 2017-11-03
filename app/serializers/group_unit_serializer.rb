class GroupUnitSerializer < ActiveModel::Serializer

  def attributes(*args)
    object.attributes.merge(
        {
            "full" => check_full,
            "paid" => paid_group, # boolean : default false if not paid
            "users_list" => group_users,
            "manager_info" => group_manager
        }
    )
  end

  has_one :group_detail
  has_many :activities, serializer: ActivitySerializer
  has_many :posts
  # 여기선 글들, 이미지들 까지 싹 보여진다

  def check_full
    object.full?
  end

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

  def group_manager
    object.manager_info
  end

  def posts
    object.posts.reverse
  end

end
