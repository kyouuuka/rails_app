class Like < ApplicationRecord
  belongs_to :insta
  belongs_to :user
  validates_uniqueness_of :insta_id, scope: :user_id
end
