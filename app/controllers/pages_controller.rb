class PagesController < ApplicationController
  def home
  end

  def account_info
    @user = current_user
  end

  def dashboard
    @user = current_user
    @listings = Listing.where(user: @user)
  end
end
