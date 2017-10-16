class Spoting < ApplicationRecord
  belongs_to :user, :counter_cache => :spots_count
  belongs_to :spot, :counter_cache => :users_count
end
