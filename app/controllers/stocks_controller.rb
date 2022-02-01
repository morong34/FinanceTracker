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
        flash[:alert] = "Could not find the stock"
        redirect_to my_portofolio_path
      end
    else
      flash[:alert] = "Please enter a symbol to search"
      redirect_to my_portofolio_path
    end
  end
end