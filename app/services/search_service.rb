# frozen_string_literal: true

class SearchService
  def initialize(search_param, current_user)
    @search_param = search_param.downcase
    @current_user = current_user
  end

  def perform_search
    search_result = {}
    search_result[:reviews_by_title]       = fetch_reviews_by_title
    search_result[:reviews_by_description] = fetch_reviews_by_description
    search_result[:reviews_by_user_name]   = fetch_reviews_by_user_name
    search_result.as_json
  end

  private

  def fetch_reviews_by_title
    BookReview.all.where('lower(title) LIKE :search', search: "%#{@search_param}%")
  end

  def fetch_reviews_by_description
    BookReview.all.where('lower(description) LIKE :search', search: "%#{@search_param}%")
  end

  def fetch_reviews_by_user_name
    current_user.following.joins(:book_reviews).where("users.name = #{@search_param}").select('book_reviews.*')
  end

end
