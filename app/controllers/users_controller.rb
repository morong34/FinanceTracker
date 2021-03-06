class UsersController < ApplicationController

  def my_portofolio
    @user = current_user
    @tracked_stocks = current_user.stocks
  end

  def my_friends
    @friends = current_user.friends
  end

  def show
    @user = User.find(params[:id])
    @tracked_stocks = @user.stocks
  end

  def search
    if params[:friend].present?
      @friend = User.search(params[:friend])
      if @friend
        respond_to do |format|
          format.js { render partial: 'users/friend_result'}
          format.json
          format.html do 
            redirect_to '/'
          end
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Couldn't find user"
          format.js { render partial: 'users/friend_result'}
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a friend name or email address"
        format.js { render partial: 'users/friend_result'}
      end
    end
  end
end
