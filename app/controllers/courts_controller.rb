class CourtsController < ApplicationController
  def show
    @court = CourtsFrontend.content_store.content_item(request.fullpath)
  end
end
