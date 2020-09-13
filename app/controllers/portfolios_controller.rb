class PortfoliosController < ApplicationController
  before_action :find_portfolio, only: [:show, :destroy, :edit, :update]
  layout "portfolio"
  def index
    @portfolio_items = Portfolio.all
  end

  def soya
    @soya_items = Portfolio.soya
  end

  def cheese
    @cheese_items = Portfolio.cheese
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.cousines.build}
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)
    if @portfolio_item.save
      redirect_to portfolios_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @portfolio_item.update(portfolio_params)
      redirect_to portfolios_path
    else
      render :edit
    end
  end
  def show
    @page_title = @portfolio_item.title
  end
  def destroy
    if @portfolio_item.destroy
      redirect_to portfolios_path, notice: "Record was removed"
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(
                                      :title, 
                                      :description, 
                                      :body, 
                                      cousines_attributes: [:name]
                                    )
  end

  def find_portfolio
    @portfolio_item = Portfolio.friendly.find(params[:id])
  end
end
