class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_search

  def set_search
    @q = Package.ransack(params[:q])
  end
end
