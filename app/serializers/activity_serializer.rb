class ActivitySerializer < ActiveModel::Serializer

  def attributes(*args)
    object.attributes.merge(
        {
            "full" => check_full
        }
    )
  end

  has_one :activity_detail

  def check_full
    object.full?
  end

end
