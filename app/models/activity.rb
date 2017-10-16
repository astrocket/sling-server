class Activity < ApplicationRecord
  belongs_to :group
  has_many :activations
  has_many :users, through: :activations
  has_one :activity_detail
end