class SearchController < ApplicationController
  def index
    @members = SearchFacade.members(params[:state])
  end
end