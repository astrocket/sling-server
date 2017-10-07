class Group < ApplicationRecord
  belongs_to :manager, class_name: 'User', foreign_key: :manager_id
  has_many :groupings
  has_many :users, through: :groupings
end
