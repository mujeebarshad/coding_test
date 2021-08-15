# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :authenticable, :rememberable, :validatable,
         :trackable, :recoverable

  DEFAULT_PASSWORD_LENGTH = 8
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX, message: I18n.t('errors.email_exists_message') }
  validates :name, presence: true, length: { maximum: 70 }
  validates :password, presence: true, length: { minimum: DEFAULT_PASSWORD_LENGTH, maximum: 255 }

  has_many :users_followers, foreign_key: :user_id, class_name: 'UserFollower'
  has_many :users_followings, foreign_key: :follower_id, class_name: 'UserFollower'
  has_many :followers, through: :users_followers, source: :follower
  has_many :following, through: :users_followings, source: :user
  has_many :book_reviews

  # fetch user's all reviews for a book
  def fetch_reviews_for_a_book(book_title)
    book_reviews.joins(:book).where('books.title = :title', title: book_title)
  end

  # fetch reviews of the following users
  def fetch_reviews_of_following
    following.joins(book_reviews: :book)
  end

end
