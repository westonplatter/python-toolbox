class HomeController < ApplicationController
  def index
    @q = Package.ransack(params[:q])
  end

  def empty_response
    head :ok, :content_type => 'text/html'
  end
end
