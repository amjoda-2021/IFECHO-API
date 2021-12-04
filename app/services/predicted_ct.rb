# frozen_string_literal: true
class PredictedCt
  def initialize(site, number_days_forward, from_date)
    @site = site
    @number_days_forward = number_days_forward
    @from_date = from_date
  end

  def perform
    CtDatum.where(site: @site, date: @from_date.to_s..end_date.to_s).pluck(:ct)
  end

  private

  def end_date
    @from_date + @number_days_forward
  end
end
