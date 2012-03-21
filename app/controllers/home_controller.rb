class HomeController < ApplicationController

  def index
    @response = Response.find(session[:response_id])
  rescue ActiveRecord::RecordNotFound => e
    @response = Response.new(:guests => 1, :attending => true)
  end

end
