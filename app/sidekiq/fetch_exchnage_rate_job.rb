class FetchExchnageRateJob
  include Sidekiq::Job

  def perform
    FetchRates.new(Rails.application.credentials.nbp[:base_uri]).fetch_exchange_rates
  end
end
