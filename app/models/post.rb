class Post < ApplicationRecord
  before_create :set_comments_count

  belongs_to :group, optional: true
  belongs_to :user
  has_many :comments

  private

  def set_comments_count
    self.comments_count = 0
  end
end
