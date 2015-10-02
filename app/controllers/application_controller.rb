class ApplicationController < ActionController::Base
  include Slimmer::SharedTemplates

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def error_not_found
    render status: :not_found, text: "404 error not found"
  end
end
