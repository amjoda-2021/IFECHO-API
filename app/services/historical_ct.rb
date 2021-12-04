# frozen_string_literal: true
class HistoricalCt
  def initialize(site, number_days_back, to_date)
    @site = site
    @number_days_back = number_days_back
    @to_date = to_date
  end

  def perform
    CtDatum.where(site: @site, date: start_date.to_s..@to_date.to_s).pluck(:ct)
  end

  private

  def start_date
    @to_date - @number_days_back
  end
end
