class Spot < ApplicationRecord
  after_create :set_organizer_info
  serialize :users_list, Array

  belongs_to :organizer, class_name: 'User', foreign_key: :organizer_id
  has_many :spotings
  has_many :users, through: :spotings
  has_one :spot_detail
  has_one :web_product, as: :product

  def set_organizer_info
    o = self.organizer
    od = self.organizer.user_detail
    organizer_info = {
        id: o.id,
        key: o.key,
        :user_detail => od.attributes.merge(
            {
                "pic_thumb" => od.pic.url(:thumb),
                "pic_medium" => od.pic.url(:medium),
                "pic_large" => od.pic.url(:xhdpi_4by3),
                "pic_original" => od.pic.url
            }
        )
    }.to_json
    self.organizer_info = organizer_info
    self.save
  end

end
