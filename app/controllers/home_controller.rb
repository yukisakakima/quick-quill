class HomeController < ApplicationController
  before_action :redirect_if_signed_in, only: [:top]

  def top
  end

  def about
  end

  private

  def redirect_if_signed_in
    if user_signed_in?
      flash[:notice] = "すでにログインしています"
      redirect_to("/posts/index")
    end
  end
end
