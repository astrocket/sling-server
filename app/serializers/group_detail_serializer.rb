class GroupDetailSerializer < ActiveModel::Serializer

  def attributes(*args)
    object.attributes.merge(
        {
            "pic_thumb" => pic_thumb,
            "pic_medium" => pic_medium,
            "pic_large" => pic_large,
            "pic_original" => pic_original
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

end
