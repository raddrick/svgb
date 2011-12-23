class FramesController < ApplicationController
  # GET /frames
  # GET /frames.json
  def index
    @frames = Frame.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @frames }
    end
  end

  # GET /frames/1
  # GET /frames/1.json
  def show
    @frame = Frame.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @frame }
    end
  end

  # GET /frames/new
  # GET /frames/new.json
  def new
    @frame = Frame.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @frame }
    end
  end

  # GET /frames/1/edit
  def edit
    @frame = Frame.find(params[:id])
  end

  # POST /frames
  # POST /frames.json
  def create
    @frame = Frame.new(params[:frame])

    respond_to do |format|
      if @frame.save
        format.html { redirect_to @frame, notice: 'Frame was successfully created.' }
        format.json { render json: @frame, status: :created, location: @frame }
      else
        format.html { render action: "new" }
        format.json { render json: @frame.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /frames/1
  # PUT /frames/1.json
  def update
    @frame = Frame.find(params[:id])

    respond_to do |format|
      if @frame.update_attributes(params[:frame])
        format.html { redirect_to @frame, notice: 'Frame was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @frame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /frames/1
  # DELETE /frames/1.json
  def destroy
    @frame = Frame.find(params[:id])
    @frame.destroy

    respond_to do |format|
      format.html { redirect_to frames_url }
      format.json { head :ok }
    end
  end
end
