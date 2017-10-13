class Grouping < ApplicationRecord
  belongs_to :user, :counter_cache => :groups_count
  belongs_to :group, :counter_cache => :users_count
end
