class User < ApplicationRecord
  rolify
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :assign_default_role

  has_many :managing_groups, class_name: 'Group', foreign_key: :manager_id
  has_many :groupings
  has_many :groups, through: :groupings

  private

  def assign_default_role
    self.add_role(:candidate) if self.roles.blank?
  end

end
