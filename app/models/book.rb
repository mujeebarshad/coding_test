# == Schema Information
#
# Table name: books
#
#  id          :integer
#  title       :string(255)
#  author_name :string(255)
#  publisher   :string(255)
#  edition     :integer

# frozen_string_literal: true

class Book < ApplicationRecord
  validates :title, presence: true, length: { maximum: 70 }
  validates :author_name, presence: true, length: { maximum: 70 }
  validates :edition, presence: true, length: { minimum: 1 }

  has_many :book_reviews

end
