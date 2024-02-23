class Follower < ApplicationRecord
  belongs_to :user, foreign_key: 'followed_id'
  belongs_to :user, foreign_key: 'follower_id'
end
