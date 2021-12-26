class PortfoliosController < ApplicationController
	before_action :set_portfolio_item, only: [:edit, :update, :destroy]
	
	layout 'portfolio'

	def index
		@portfolio_items = Portfolio.all
	end

	def new
		@portfolio_item = Portfolio.new
	end

	def create
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: "Your portfolio item is now live" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  	end

  	def edit
  	end

  	def update
  	respond_to do |format|
      	if @portfolio_item.update(portfolio_params)
        	format.html { redirect_to portfolios_path, notice: "The record was successfully updated." }
      	else
        	format.html { render :edit, status: :unprocessable_entity }
      	end
    	end
  	end

  	def show
  	end

  	def destroy
  		#Destroy/delete the record
  		@portfolio_item.destroy

  		#Redirect
    	respond_to do |format|
      	format.html { redirect_to portfolios_url, notice: "The record was successfully destroyed." }
    	end
  	end
  	private 
  	def portfolio_params
  		params.require(:portfolio).permit(:title, 
  																			:subtitle, 
  																			:body
  																			)

  	end
  	def set_portfolio_item
  		@portfolio_item = Portfolio.find(params[:id])
  	end

end

