class Spoting < ApplicationRecord
  after_save :set_users_list
  before_destroy :reset_users_list

  belongs_to :user, :counter_cache => :spots_count
  belongs_to :spot, :counter_cache => :users_count

  def set_users_list
    u = self.user
    ud = self.user.user_detail
    new_user = {
        id: u.id,
        key: u.key,
        :user_detail => self.user.user_detail.attributes.merge(
            {
                "pic_thumb" => ud.pic.url(:thumb),
                "pic_medium" => ud.pic.url(:medium),
                "pic_large" => ud.pic.url(:xhdpi_4by3),
                "pic_original" => ud.pic.url
            }
        )
    }.to_json
    self.spot.users_list << new_user
    self.spot.save
  end

  def reset_users_list
    leaving_user = self.user
    default_list = self.spot.users_list
    self.spot.users_list = default_list.reject { |u| JSON.parse(u)["id"] == leaving_user.id }
    self.spot.save
  end

end
