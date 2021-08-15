# frozen_string_literal: true

module Api
  module V1
    class SearchesController < ApplicationController
      authorize_resource class: false

      # Get api/v1/search
      def search
        return redirect_to user_path(current_user) if params[:search].blank?

        @search = SearchService.new(params[:search], current_user)
        @search_results = @search.perform_search

        respond_to do |format|
          format.json { render json: @search_results, status: 200 }
        end
      end
    end
  end
end
