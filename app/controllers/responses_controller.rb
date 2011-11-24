class ResponsesController < ApplicationController
  # GET /responses
  # GET /responses.json
  def index
    @responses = Response.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @responses }
    end
  end

  # POST /responses
  def create
    @response = Response.new(params[:response])
    @response.ip = request.remote_ip

    respond_to do |format|
      if @response.save
        format.html { render :partial => @response.attending? }
      else
        format.html { render :partial => 'form' }
      end
    end
  end

  # PUT /responses/1
  def update
    @response = Response.find(params[:id])

    respond_to do |format|
      if @response.save
        format.html { render :partial => @response.attending? }
      else
        format.html { render :partial => 'form' }
      end
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.json
  def destroy
    @response = Response.find(params[:id])
    @response.destroy

    respond_to do |format|
      format.html { redirect_to responses_url }
      format.json { head :ok }
    end
  end
end
