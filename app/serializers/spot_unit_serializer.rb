class SpotUnitSerializer < ActiveModel::Serializer

  def attributes(*args)
    object.attributes.merge(
        {
            "paid" => paid_spot # boolean : default false if not paid
        }
    )
  end

  has_one :spot_detail
  has_one :organizer
  has_many :users, serializer: UserSerializer

  def paid_spot
    spoting = Spoting.where(spot: object, user: current_user).take
    if spoting
      spoting.paid
    else
      false
    end
  end
end
