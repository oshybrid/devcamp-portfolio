class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :show, :update, :destroy]
  layout "portfolio"
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :Update, :Edit]}, site_admin: :all

  def index
    @portfolio_items = Portfolio.by_position 
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def new
    @portfolio_individual_item = Portfolio.new
    3.times { @portfolio_individual_item.technologies.build }
  end
  
  def create
    

    respond_to do |format|
      if @portfolio_individual_item.save
        format.html { redirect_to portfolios_path, notice: 'Your item is now live' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  
    
  end

  def update
    @portfolio_individual_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_individual_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'The record was successfully updated' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
   
  end

  def destroy
    # This is going to perform the Lookup
    

    # Destroy the record
   

    # Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio Item was successfully destroyed.' }
    end
  end

  private 
  
  def portfolio_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle, 
                                      :body, 
                                      technologies_attributes: [:name]
                                      )
  end

  def set_portfolio_item
    @portfolio_individual_item = Portfolio.find(params[:id])
  end

end
