class Currencyrate < ApplicationRecord

  #filter by specific date
  def self.by_date(date)
    where(effective_date: date)
  end

  #list all rates for a specific currency code
  def self.by_currency(code)
    where(code: code)
  end
  #list records by date range
  def self.by_date_range(start_date, end_date)
    where("created_at >= ? or created_at <= ?", start_date, end_date)
  end

  #  genertae a csv
  def self.to_csv(params)
    attributes = %w{ table currency no code mid effective_date}
    CSV.generate(headers: true) do |csv|
      csv << ["start_date", params[:start_date]] if params[:start_date].present?
      csv << ["end_date", params[:end_date]] if params[:end_date].present?
      csv << ["Average of Currency between given dates", all.average(:mid)]
      csv << attributes
      all.each do |currencyrate|
        csv << currencyrate.attributes.values_at(*attributes)
      end
    end

  end
end
