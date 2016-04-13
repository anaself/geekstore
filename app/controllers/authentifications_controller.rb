# == Schema Information
#
# Table name: authentifications
#
#  id         :integer          not null, primary key
#  local      :json
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AuthentificationsController < ApplicationController
  before_action :set_authentification, only: [:show, :edit, :update, :destroy]

  # GET /authentifications
  # GET /authentifications.json
  def index
    @authentifications = Authentification.all
  end

  # GET /authentifications/1
  # GET /authentifications/1.json
  def show
  end

  # GET /authentifications/new
  def new
    @authentification = Authentification.new
  end

  # GET /authentifications/1/edit
  def edit
  end

  # POST /authentifications
  # POST /authentifications.json
  def create
    @authentification = Authentification.new(authentification_params)

    respond_to do |format|
      if @authentification.save
        format.html { redirect_to @authentification, notice: 'Authentification was successfully created.' }
        format.json { render :show, status: :created, location: @authentification }
      else
        format.html { render :new }
        format.json { render json: @authentification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authentifications/1
  # PATCH/PUT /authentifications/1.json
  def update
    respond_to do |format|
      if @authentification.update(authentification_params)
        format.html { redirect_to @authentification, notice: 'Authentification was successfully updated.' }
        format.json { render :show, status: :ok, location: @authentification }
      else
        format.html { render :edit }
        format.json { render json: @authentification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authentifications/1
  # DELETE /authentifications/1.json
  def destroy
    @authentification.destroy
    respond_to do |format|
      format.html { redirect_to authentifications_url, notice: 'Authentification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_authentification
    @authentification = Authentification.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def authentification_params
    params.fetch(:authentification, {})
  end
end
