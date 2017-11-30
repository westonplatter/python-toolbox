class HomeController < ApplicationController
  def index
    @q = Package.ransack(params[:q])
  end
end
