class Group < ApplicationRecord
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

end
