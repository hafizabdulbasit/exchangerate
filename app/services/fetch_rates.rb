class FetchRates
  include HTTParty
  attr_reader :base_uri

  def initialize(url)
    @base_uri = url
  end

  def fetch_exchange_rates
    ['A', 'B'].each do |table|
      response = HTTParty.get(base_uri + "tables/#{table}/")
      parsed_response = JSON.parse(response.body).first
      tab = parsed_response['table']
      no = parsed_response['no']
      effective_date = parsed_response['effectiveDate']
      rates = parsed_response['rates']
      rates.each do |rate|
        ActiveRecord::Base.transaction do
          @currency = Currencyrate.new(rate) do |currencyrate|
                      currencyrate.table = tab
                      currencyrate.no = no
                      currencyrate.effective_date = effective_date
                    end
          @currency.save
        end
      end
    end
  end
end