# frozen_string_literal: true
class HistoricalThi
  def initialize(site, numbers_day_back)
    @site = site
    @numbers_day_back = numbers_day_back
    # pour des raisons de démonstration lors du Hackaton du 04/12, la date d'aujourd'hui est fixée au 09/07/2019
    @today = "09/07/2019".to_time
  end

  def perform
    ThiDatum.where(site: @site, date: start_date..@today)
  end

  private
  def start_date
    @today - 3600*24*@numbers_day_back
  end

end