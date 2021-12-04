# frozen_string_literal: true
class PredictedThi

  def initialize(site, number_days_forward, from_date)
    @site = site
    @number_days_forward = number_days_forward
    @from_date = from_date
  end

  def perform
    ThiDatum.where(site: @site, date: @from_date.to_s..end_date().to_s).pluck(:thi)
  end

  private
  def end_date
    end_date = @from_date + @number_days_forward
  end

end