class PackagesController < ApplicationController

  before_action :set_package, except: [:search]

  def search
    PingSlackJob.perform_async("PackagesController - search -- q_name = #{params['q']}")

    @q = Package.ransack(params[:q])
    @packages = @q.result(distinct: true).order("total_downloads desc")

    render "packages/index"
  end

  def show
    PingSlackJob.perform_async("PackagesController - show -- package_name = #{@package.name}")
  end

  private

  def set_package
    @package = Package.find_by(name: params[:id])
  end
end
