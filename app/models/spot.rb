class Spot < ApplicationRecord
  before_create :set_users_count
  after_create :set_organizer_info
  serialize :users_list, Array

  belongs_to :organizer, class_name: 'User', foreign_key: :organizer_id
  has_many :spotings
  has_many :users, through: :spotings
  has_one :spot_detail
  has_one :web_product, as: :product

  scope :index, -> user { where.not( id: user.spots.ids).includes(:spot_detail).order('spot_details.schedule DESC') }
  scope :my_index, -> user { user.spots.includes(:spot_detail).order('spot_details.schedule DESC') }

  def paid_users
    self.users.references(:spotings).where(spotings: { paid: true })
  end

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

  def set_users_count
    self.users_count = 0
  end

  def full?
    self.maximum <= self.users_count
  end

end
