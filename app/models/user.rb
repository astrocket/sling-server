class User < ApplicationRecord
  FB = 'facebook'
  KAKAO = 'kakao'

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
  # 스팟
  has_many :organizing_spots, class_name: 'Spot', foreign_key: :organizer_id
  has_many :spotings
  has_many :spots, through: :spotings
  # 유저정보
  has_one :user_detail
  has_many :web_purchases
  # 게시글
  has_many :posts
  has_many :comments

  search_scope :search_by_key do
    attributes :key

    options :key, :type => :fulltext
  end

  # Facebook Auth
  def self.from_fb_omniauth(auth)
    if exists?(provider: FB, fb_uid: auth["id"])
      where(provider: FB, fb_uid:  auth["id"]).first
    elsif exists?(provider: KAKAO, email: auth["email"]) # 카카오로 이미 가입한 동일 이메일 회원일 경우
      user = where(provider: nil, email: auth["email"]).first
      user.provider = FB
      user.fb_uid =  auth["id"]
      user.save
      user
    else
      create do |user|
        user.provider = FB
        user.fb_uid =  auth["id"]
        user.email = auth["email"] || "#{FB}-#{auth["id"]}@sling.com"
        user.password = Devise.friendly_token[0,20]
      end
    end
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
