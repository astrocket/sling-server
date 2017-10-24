class Spot < ApplicationRecord
  serialize :users_list, Array

  belongs_to :organizer, class_name: 'User', foreign_key: :organizer_id
  has_many :spotings
  has_many :users, through: :spotings
  has_one :spot_detail
  has_one :web_product, as: :product
end
