class PortfoliosController < ApplicationController
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
    @portfolio_item = Portfolio.friendly.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.friendly.find(params[:id])

    if @portfolio_item.update(portfolio_params)
      redirect_to portfolios_path
    else
      render :edit
    end
  end
  def show
    @portfolio_item = Portfolio.friendly.find(params[:id])
  end
  def destroy
    @portfolio_item = Portfolio.friendly.find(params[:id])
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
end
