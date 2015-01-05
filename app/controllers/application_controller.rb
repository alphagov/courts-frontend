class ApplicationController < ActionController::Base
  include Slimmer::Headers
  include Slimmer::SharedTemplates

  before_filter :set_slimmer_headers

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def error_not_found
    render status: :not_found, text: "404 error not found"
  end

  def set_slimmer_headers
    response.headers[Slimmer::Headers::TEMPLATE_HEADER] = "core_layout"
  end
end
