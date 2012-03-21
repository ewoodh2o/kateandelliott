class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :print_session

  def print_session
    Rails.logger.info "  Session: #{session.inspect}"
  end
end
