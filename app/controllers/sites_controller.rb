# frozen_string_literal: true
class SitesController < ApplicationController
  before_action :set_site, only: %i[show update destroy]
  before_action :authenticate_user!

  # GET /sites
  def index
    @sites = Site.all

    render json: @sites
  end

  # GET /sites/1
  def show
    render json: {site: @site, historical_thi: HistoricalThi.new(@site, 5)}
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
  end

  # Only allow a list of trusted parameters through.
  def site_params
    params.fetch(:site, {})
  end
end
