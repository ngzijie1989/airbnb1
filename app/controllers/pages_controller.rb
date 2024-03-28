class PagesController < ApplicationController
  def home
  end

  def account_info
    @user = current_user
  end
end
