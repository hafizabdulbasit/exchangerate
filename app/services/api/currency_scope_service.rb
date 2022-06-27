module Api
  class CurrencyScopeService
    attr_reader :resource, :params
    def initialize(resource, params)
      @resource = resource
      @params = params
    end

    def get_collection
      return nil  if params[:currency].blank?
      rates = resource.by_currency(params[:currency])
      rates = rates.by_date(params[:date]) if params[:date].present?
      rates = rates.by_date_range(params[:start_date],params[:end_date]) if params[:start_date].present? && params[:end_date].present?
      rates.order(effective_date: :desc)
    end
  end
end
