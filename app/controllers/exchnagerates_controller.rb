class ExchnageratesController < ApplicationController
  def index
    @rates = resource_class.all.order('effective_date desc').paginate(page: params[:page], per_page: 25)
  end

  def create
    FetchExchnageRateJob.perform_async
    redirect_to root_path, notice: "Process of Fetching Exchange Rate started. Please wait.."
  end


  private

  def resource_class
    Currencyrate
  end
end
