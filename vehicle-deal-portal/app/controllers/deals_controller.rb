class DealsController < ApplicationController
  before_action :set_deal, only: %i[ show edit update destroy ]

  # GET /deals or /deals.json
  def index
    @deals = Deal.order(deal_date: :desc)

    current_month = Date.current.beginning_of_month..Date.current.end_of_month

    @total_this_month = Deal.where(deal_date: current_month).count
    @pending_deals = Deal.where(status: Deal::PENDING_STATUSES)
    @finalised_deals = Deal.where(status: Deal::FINAL_STATUSES)
    @fallovers = Deal.where(status: "Fallover")
    @delayed_deals = Deal.all.select(&:delayed?)
  end

  # GET /deals/1 or /deals/1.json
  def show
  end

  # GET /deals/new
  def new
    @deal = Deal.new
  end

  # GET /deals/1/edit
  def edit
  end

  # POST /deals or /deals.json
  def create
    @deal = Deal.new(deal_params)

    respond_to do |format|
      if @deal.save
        format.html { redirect_to @deal, notice: "Deal was successfully created." }
        format.json { render :show, status: :created, location: @deal }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @deal.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /deals/1 or /deals/1.json
  def update
    respond_to do |format|
      if @deal.update(deal_params)
        format.html { redirect_to @deal, notice: "Deal was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @deal }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @deal.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /deals/1 or /deals/1.json
  def destroy
    @deal.destroy!

    respond_to do |format|
      format.html { redirect_to deals_path, notice: "Deal was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deal
      @deal = Deal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def deal_params
  	params.require(:deal).permit(
    	  :deal_date,
    	  :deal_number,
    	  :stock_number,
    	  :salesperson,
    	  :vehicle_type,
    	  :customer_name,
    	  :vehicle_purchased,
    	  :has_trade,
    	  :contact_number,
    	  :status,
    	  :estimated_delivery_date,
    	  :notes,
    	  documents: []
    )
end
end
