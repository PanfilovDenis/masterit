class RegistrationWorksController < ApplicationController
  # GET /registration_works
  # GET /registration_works.json
  def index
    @registration_works = RegistrationWork.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @registration_works }
    end
  end

  # GET /registration_works/1
  # GET /registration_works/1.json
  def show
    @registration_work = RegistrationWork.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @registration_work }
    end
  end

  # GET /registration_works/new
  # GET /registration_works/new.json
  def new
    @registration_work = RegistrationWork.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @registration_work }
    end
  end

  # GET /registration_works/1/edit
  def edit
    @registration_work = RegistrationWork.find(params[:id])
  end

  # POST /registration_works
  # POST /registration_works.json
  def create
    @registration_work = RegistrationWork.new(params[:registration_work])

    respond_to do |format|
      if @registration_work.save
        format.html { redirect_to @registration_work, notice: 'Registration work was successfully created.' }
        format.json { render json: @registration_work, status: :created, location: @registration_work }
      else
        format.html { render action: "new" }
        format.json { render json: @registration_work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /registration_works/1
  # PUT /registration_works/1.json
  def update
    @registration_work = RegistrationWork.find(params[:id])

    respond_to do |format|
      if @registration_work.update_attributes(params[:registration_work])
        format.html { redirect_to @registration_work, notice: 'Registration work was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @registration_work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registration_works/1
  # DELETE /registration_works/1.json
  def destroy
    @registration_work = RegistrationWork.find(params[:id])
    @registration_work.destroy

    respond_to do |format|
      format.html { redirect_to registration_works_url }
      format.json { head :no_content }
    end
  end
end
