# frozen_string_literal: true
class SitesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_site, only: %i[show update destroy]

  # GET /sites
  def index
    @sites = Site.all
    # @sites = current_user.sites

    render json: @sites
  end

  # GET /sites/1
  def show
    final_dataset = ReturnThermalData
                    .new(Site.where(name: 'DERVAL').first,
                         5, 5, params[:date]).perform

    render json: { site: @site,
                   historical_thi: final_dataset[:historical_thi],
                   historical_ct: final_dataset[:historical_ct],
                   future_thi: final_dataset[:predicted_thi],
                   future_ct: final_dataset[:predicted_ct] }
  end

  # POST /sites
  def create
    @site = Site.new(site_params)

    if @site.save
      render json: @site, status: :created, location: @site
    else
      render json: @site.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sites/1
  def update
    if @site.update(site_params)
      render json: @site
    else
      render json: @site.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sites/1
  def destroy
    @site.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_site
    @site = Site.find(params[:id])
    # @site = current_user.sites.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def site_params
    params.require(:user).permit(:name, :site_type, :breeder_id, :location, :city, :post_code, :longitude, :latitude)
  end
end
