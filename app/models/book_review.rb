# == Schema Information
#
# Table name: book_reviews
#
#  id          :integer
#  user_id     :integer
#  book_id     :integer
#  title       :string(255)
#  description :string(255)
#  rate        :integer

# frozen_string_literal: true

class BookReview < ApplicationRecord
  belongs_to :book
  belongs_to :user

  HIGHEST_REVIEW_RATE = 10

  validates :title, presence: true, length: { maximum: 70 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :rate, presence: true, length: { minimum: 0, maximum: HIGHEST_REVIEW_RATE }
  validates :user_id, presence: true
  validates :book_id, presence: true

end