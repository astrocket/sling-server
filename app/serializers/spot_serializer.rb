class SpotSerializer < ActiveModel::Serializer

  def attributes(*args)
    object.attributes.merge(
        {
            "paid" => paid_spot, # boolean : default false if not paid
            "organizer_info" => spot_organizer
        }
    )
  end

  has_one :spot_detail

  def paid_spot
    spoting = Spoting.where(spot: object, user: current_user).take if defined?(current_user)
    if spoting
      spoting.paid
    else
      false
    end
  end

  def spot_organizer
    object.organizer_info
  end

end
