class SpotDetailSerializer < ActiveModel::Serializer

  def attributes(*args)
    object.attributes.except(:schedule).merge(
        {
            "pic_thumb" => pic_thumb,
            "pic_medium" => pic_medium,
            "pic_large" => pic_large,
            "pic_original" => pic_original,
            "schedule" => custom_schedule,
        }
    )
  end

  def pic_thumb
    object.pic.url(:thumb)
  end

  def pic_medium
    object.pic.url(:medium)
  end

  def pic_large
    object.pic.url(:xhdpi_4by3)
  end

  def pic_original
    object.pic.url
  end

  def custom_schedule
    object.schedule.strftime("%m/%d %I:%M%p")
  end

end
