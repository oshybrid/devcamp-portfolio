class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def new
    @portfolio_individual_item = Portfolio.new
    3.times { @portfolio_individual_item.technologies.build }
  end
  
  def create
    @portfolio_individual_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name]))

    respond_to do |format|
      if @portfolio_individual_item.save
        format.html { redirect_to portfolios_path, notice: 'Your item is now live' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @portfolio_individual_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_individual_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_individual_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'The record was successfully updated' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @portfolio_individual_item = Portfolio.find(params[:id])
  end

  def destroy
    # This is going to perform the Lookup
    @portfolio_individual_item = Portfolio.find(params[:id])

    # Destroy the record
    @portfolio_individual_item.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio Item was successfully destroyed.' }
    end
  end
end
