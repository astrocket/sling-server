class GroupUnitSerializer < ActiveModel::Serializer

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
  has_many :posts
  # 여기선 글들, 이미지들 까지 싹 보여진다

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

  def posts
    object.posts.reverse
  end

end
