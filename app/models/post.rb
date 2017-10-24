class Post < ApplicationRecord

  belongs_to :group, optional: true
  belongs_to :user
  has_many :comments
end
