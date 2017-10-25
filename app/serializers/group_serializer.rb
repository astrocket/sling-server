class GroupSerializer < ActiveModel::Serializer

  def attributes(*args)
    object.attributes.merge(
        {
            "paid" => paid_group, # boolean : default false if not paid
            "manager_info" => group_manager
        }
    )
  end

  has_one :group_detail

  def paid_group
    grouping = Grouping.where(group: object, user: current_user).take
    if grouping
      grouping.paid
    else
      false
    end
  end

  def group_manager
    object.manager_info
  end

end
