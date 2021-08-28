# == Schema Information
#
# Table name: user_followers
#
#  id          :integer
#  user_id     :integer
#  follower_id :integer

# frozen_string_literal: true

class UserFollower < ApplicationRecord
  validates :user_id, presence: true
  validates :follower_id, presence: true

  belongs_to :user
  belongs_to :follower, class_name: 'User'

end
