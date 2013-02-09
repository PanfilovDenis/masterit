class NominatesController < ApplicationController
  # GET /nominates
  # GET /nominates.json
  def index
    @nominates = Nominate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nominates }
    end
  end

  # GET /nominates/1
  # GET /nominates/1.json
  def show
    @nominate = Nominate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @nominate }
    end
  end

  # GET /nominates/new
  # GET /nominates/new.json
  def new
    @nominate = Nominate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @nominate }
    end
  end

  # GET /nominates/1/edit
  def edit
    @nominate = Nominate.find(params[:id])
  end

  # POST /nominates
  # POST /nominates.json
  def create
    @nominate = Nominate.new(params[:nominate])

    respond_to do |format|
      if @nominate.save
        format.html { redirect_to @nominate, notice: 'Nominate was successfully created.' }
        format.json { render json: @nominate, status: :created, location: @nominate }
      else
        format.html { render action: "new" }
        format.json { render json: @nominate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /nominates/1
  # PUT /nominates/1.json
  def update
    @nominate = Nominate.find(params[:id])

    respond_to do |format|
      if @nominate.update_attributes(params[:nominate])
        format.html { redirect_to @nominate, notice: 'Nominate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @nominate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nominates/1
  # DELETE /nominates/1.json
  def destroy
    @nominate = Nominate.find(params[:id])
    @nominate.destroy

    respond_to do |format|
      format.html { redirect_to nominates_url }
      format.json { head :no_content }
    end
  end
end
