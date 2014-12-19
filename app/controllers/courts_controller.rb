class CourtsController < ApplicationController
  def show
    @court = CourtsFrontend.content_store.content_item(request.fullpath)
    error_not_found unless @court
  end
end
