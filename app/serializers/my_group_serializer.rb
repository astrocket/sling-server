class MyGroupSerializer < ActiveModel::Serializer

  def attributes(*args)
    object.attributes.merge(
        {
            "paid" => paid_group # boolean : default false if not paid
        }
    )
  end

  has_one :group_detail
  has_one :manager

  def paid_group
    Grouping.where(group: object, user: current_user).take.paid
  end

end
