# frozen_string_literal: true
class HistoricalThi
  def initialize(site, number_days_back, to_date)
    @site = site
    @number_days_back = number_days_back
    @to_date = to_date
  end

  def perform
    ThiDatum.where(site: @site, date: start_date.to_s..@to_date.to_s).pluck(:thi)
  end

  private

  def start_date
    @to_date - @number_days_back
  end
end
