class StocksController < ApplicationController
  respond_to :html, :json

  def search 
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial: 'users/result'}
          format.json
          format.html do 
            redirect_to '/'
          end
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Please enter a valid symbol to search"
          format.js { render partial: 'users/result'}
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Could not find the stock, something is wrong with your search"
        format.js { render partial: 'users/result'}
      end
    end
  end
end