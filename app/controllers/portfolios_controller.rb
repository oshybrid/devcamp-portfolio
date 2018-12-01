class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_individual_item = Portfolio.new
  end
  
  def create
    @portfolio_individual_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_individual_item.save
        format.html { redirect_to portfolios_path, notice: 'Your item is now live' }
      else
        format.html { render :new }
      end
    end
  end

end
