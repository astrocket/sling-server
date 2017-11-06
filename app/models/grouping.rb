class Grouping < ApplicationRecord
  after_create :set_users_list
  before_destroy :reset_users_list
  validate :already_full?, on: :create
  validate :already_joined?, on: :create

  belongs_to :user, :counter_cache => :groups_count
  belongs_to :group, :counter_cache => :users_count

  def already_full?
    if self.group.full?
      errors.add(:base, "Group is already full") and false
    end
  end

  # Group.find(4).users << User.find(3)
  # Grouping.last(5).map { |g| g.destroy }
  def already_joined?
    joining_user = self.user
    default_users = self.group.users.pluck(:id)
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
        :user_detail => ud.attributes.merge(
            {
                "pic_thumb" => ud.pic.url(:thumb),
                "pic_medium" => ud.pic.url(:medium),
                "pic_large" => ud.pic.url(:xhdpi_4by3),
                "pic_original" => ud.pic.url
            }
        )
    }.to_json
    self.group.users_list << new_user
    self.group.save
  end

  def reset_users_list
    leaving_user = self.user
    default_list = self.group.users_list
    self.group.users_list = default_list.reject { |u| JSON.parse(u)["id"] == leaving_user.id }
    self.group.save
  end

end
