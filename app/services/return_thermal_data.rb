# frozen_string_literal: true
class ReturnThermalData
  def initialize(site, number_days_back, number_days_forward, reference_date)
    @site = site
    @number_days_back = number_days_back
    @number_days_forward = number_days_forward
    @reference_date = reference_date.to_date
    @final_data_set = { historical_thi: [], predicted_thi: [], historical_ct: [], predicted_ct: [] }
  end

  def perform
    @final_data_set[:historical_thi] = HistoricalThi
                                       .new(@site, @number_days_back, @reference_date).perform
    @final_data_set[:predicted_thi] = PredictedThi
                                      .new(@site, @number_days_forward, @reference_date).perform
    @final_data_set[:historical_ct] = HistoricalCt
                                      .new(@site, @number_days_back, @reference_date).perform
    @final_data_set[:predicted_ct] = PredictedCt
                                     .new(@site, @number_days_forward, @reference_date).perform
    complete_ct_dataset
  end

  private

  def complete_ct_dataset
    ct_past_dataset_length = @final_data_set[:historical_ct].count
    ct_future_dataset_length = @final_data_set[:predicted_ct].count
    initial_not_a_number_array = Array.new(ct_past_dataset_length, 'NaN')
    final_not_a_number_array = Array.new(ct_future_dataset_length, 'NaN')
    @final_data_set[:historical_ct] = @final_data_set[:historical_ct] + final_not_a_number_array
    @final_data_set[:predicted_ct] = initial_not_a_number_array + @final_data_set[:predicted_ct]
    @final_data_set
  end
end
