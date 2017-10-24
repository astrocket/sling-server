class SpotUnitSerializer < ActiveModel::Serializer

  def attributes(*args)
    object.attributes.merge(
        {
            "paid" => paid_spot, # boolean : default false if not paid
            "users_list" => spot_users
        }
    )
  end

  has_one :spot_detail
  has_one :organizer

  def paid_spot
    spoting = Spoting.where(spot: object, user: current_user).take
    if spoting
      spoting.paid
    else
      false
    end
  end

  def spot_users
    object.users_list
  end

end
