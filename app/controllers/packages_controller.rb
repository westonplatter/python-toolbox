class PackagesController < ApplicationController

  def search
    # PingSlackJob.perform_async("PackagesController - search -- q_name = #{params['q']}")

    @q = Package.ransack(params[:q])
    @packages = @q.
      result(distinct: true).
      order("total_downloads desc").
      paginate(:page => params[:page], :per_page => 30)

    render 'packages/index'
  end

  def index
    # PingSlackJob.perform_async("PackagesController - search -- q_name = #{params['q']}")

    @q = Package.ransack(params[:q])
    @packages = @q.
      result(distinct: true).
      order("total_downloads desc").
      paginate(:page => params[:page], :per_page => 30)

    # render 'packages/index'
  end

  def show
    @package = Package.find_by(name: params[:id])
    # PingSlackJob.perform_async("PackagesController - show -- package_name = #{@package.name}")
  end
end
