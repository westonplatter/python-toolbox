class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_search
  before_action :better_errors_hack, if: -> { Rails.env.development? }

  def set_search
    @q = Package.ransack(params[:q])
  end

  private
  
  def better_errors_hack
    request.env['puma.config'].options.user_options.delete(:app) if request.env.has_key?('puma.config')
  end
end
