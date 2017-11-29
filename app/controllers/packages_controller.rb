class PackagesController < ApplicationController

  before_action :set_package, except: [:search]

  def search
    name = params[:q_name]

    PingSlackWorker.perform_async("PackagesController - search -- q_name = #{name}. #{Time.now.in_time_zone('America/Denver').strftime("%m/%d %H:%M")}")

    @packages = Package.where("name ILIKE ?", "%#{name}%")
    render "packages/index"
  end

  def show
    PingSlackWorker.perform_async("PackagesController - show -- package_name = #{@package.name}. #{Time.now.in_time_zone('America/Denver').strftime("%m/%d %H:%M")}")
  end

  private

  def set_package
    @package = Package.find_by(name: params[:id])
  end
end
