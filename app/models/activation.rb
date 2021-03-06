class Activation < ApplicationRecord
  after_save :set_users_list
  before_destroy :reset_users_list
  validate :already_full?, on: :create
  validate :already_joined?, on: :create

  belongs_to :activity, :counter_cache => :users_count
  belongs_to :user, :counter_cache => :activities_count

  def already_full?
    if self.activity.full?
      errors.add(:base, "Activity is already full") and false
    end
  end

  def already_joined?
    joining_user = self.user
    default_users = self.activity.users.pluck(:id)
    if default_users.include?(joining_user.id)
      errors.add(:joining_user, "already joined user") and false
    end
  end

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
    self.activity.users_list << new_user
    self.activity.save
  end

  def reset_users_list
    leaving_user = self.user
    default_list = self.activity.users_list
    self.activity.users_list = default_list.reject { |u| JSON.parse(u)["id"] == leaving_user.id }
    self.activity.save
  end

end
