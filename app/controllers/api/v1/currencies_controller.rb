class Api::V1::CurrenciesController < Api::V1::BaseController
 
  def index
    @rates = Api::CurrencyScopeService.new(resource_class, params).get_collection
    respond_to do |format|
      format.json {render json: prepare_json }
      format.csv { send_data @rates.to_csv(params)}
    end
  end

  private

  def resource_class
    Currencyrate
  end

  def prepare_json
    data = {}
    data[:start_date] = params[:start_date] if params[:start_date].present?
    data[:end_date] = params[:end_date] if params[:end_date].present?
    data[:date] = params[:date] if params[:date].present?
    data[:average_of_rate] = @rates.average(:mid)
    data[:rates] = JSON.parse(@rates.to_json(except: [:id, :created_at, :updated_at]))
    data
  end
end
