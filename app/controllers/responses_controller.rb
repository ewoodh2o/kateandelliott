class ResponsesController < ApplicationController

  before_filter :only_allow_authorized_updates, :only => :update

  # GET /responses.json
  def index
    head 403 and return unless params[:key] == 'glendale15'
    @responses = Response.all

    respond_to do |format|
      format.json { render json: @responses }
    end
  end

  # GET /responses/mine/edit
  def edit
    @response = Response.find(session[:response_id])
    render :partial => 'form'
  end

  # POST /responses
  def create
    @response = Response.new(params[:response])
    @response.ip = request.remote_ip

    respond_to do |format|
      if @response.save
        session[:response_id] = @response.id
        format.html { render :partial => @response.attending }
      else
        format.html { render :partial => 'form' }
      end
    end
  end

  # PUT /responses/1
  def update
    @response = Response.find(session[:response_id])

    respond_to do |format|
      if @response.update_attributes(params[:response])
        format.html { render :partial => @response.attending? ? 'yes' : 'no' }
      else
        format.html { render :partial => 'form' }
      end
    end
  end

  private

  def only_allow_authorized_updates
    if params[:id].to_i != session[:response_id].to_i
      render :text => 'You are not authorized to update that response.', :status => 403
    end
  end

end
