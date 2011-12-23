class ControlsController < ApplicationController
  # GET /controls
  # GET /controls.json
  def index
    @controls = Control.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @controls }
    end
  end

  # GET /controls/1
  # GET /controls/1.json
  def show
    @control = Control.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @control }
    end
  end

  # GET /controls/new
  # GET /controls/new.json
  def new
    @control = Control.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @control }
    end
  end

  # GET /controls/1/edit
  def edit
    @control = Control.find(params[:id])
  end

  # POST /controls
  # POST /controls.json
  def create
    @control = Control.new(params[:control])

    respond_to do |format|
      if @control.save
        format.html { redirect_to @control, notice: 'Control was successfully created.' }
        format.json { render json: @control, status: :created, location: @control }
      else
        format.html { render action: "new" }
        format.json { render json: @control.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /controls/1
  # PUT /controls/1.json
  def update
    @control = Control.find(params[:id])

    respond_to do |format|
      if @control.update_attributes(params[:control])
        format.html { redirect_to @control, notice: 'Control was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @control.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /controls/1
  # DELETE /controls/1.json
  def destroy
    @control = Control.find(params[:id])
    @control.destroy

    respond_to do |format|
      format.html { redirect_to controls_url }
      format.json { head :ok }
    end
  end
end
