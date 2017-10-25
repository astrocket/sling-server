class Group < ApplicationRecord
  after_create :set_manager_info
  include SearchCop
  serialize :users_list, Array

  belongs_to :manager, class_name: 'User', foreign_key: :manager_id
  has_many :groupings
  has_many :users, through: :groupings
  has_one :group_detail
  has_many :activities
  has_one :web_product, as: :product
  has_many :posts

  search_scope :search do
    attributes group_detail: ["group_detail.name", "group_detail.about"]
  end

  def paid_users
    self.users
  end

  def set_manager_info
    m = self.manager
    md = self.manager.user_detail
    manager_info = {
        id: m.id,
        key: m.key,
        :user_detail => md.attributes.merge(
            {
                "pic_thumb" => md.pic.url(:thumb),
                "pic_medium" => md.pic.url(:medium),
                "pic_large" => md.pic.url(:xhdpi_4by3),
                "pic_original" => md.pic.url
            }
        )
    }.to_json
    self.manager_info = manager_info
    self.save
  end

end
