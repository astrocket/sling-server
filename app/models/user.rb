class User < ApplicationRecord
  rolify
  acts_as_token_authenticatable
  include SearchCop
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :set_verification_key
  after_create :assign_default_role

  # 그룹
  has_many :managing_groups, class_name: 'Group', foreign_key: :manager_id
  has_many :groupings
  has_many :groups, through: :groupings
  has_many :activations
  has_many :activities, through: :activations
  has_one :user_detail
  has_many :web_purchases

  # 스팟모임

  # 게시글

  search_scope :search_by_key do
    attributes :key

    options :key, :type => :fulltext
  end

  private

    def assign_default_role
      self.add_role(:candidate) if self.roles.blank?
    end

    def generate_verification_key
      loop do
        key = SecureRandom.hex + Time.now.strftime("%Y%m%d%H%M%S")
        break key if User.search_by_key(key).empty?
      end
    end

    def set_verification_key
      self.key = generate_verification_key
    end

end
