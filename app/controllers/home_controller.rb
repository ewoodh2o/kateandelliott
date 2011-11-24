class HomeController < ApplicationController
  
  def index
    @response = Response.find(session[:response_id]) rescue Response.new
    render
  end
  
end
