class Activation < ApplicationRecord
  belongs_to :activity, :counter_cache => :users_count
  belongs_to :user, :counter_cache => :activities_count
end
