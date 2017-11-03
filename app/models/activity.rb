class Activity < ApplicationRecord
  before_create :set_users_count

  serialize :users_list, Array

  belongs_to :group
  has_many :activations
  has_many :users, through: :activations
  has_one :activity_detail

  def set_users_count
    self.users_count = 0
  end

  def full?
    self.maximum <= self.users_count
  end

end
