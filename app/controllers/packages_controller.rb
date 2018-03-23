class PackagesController < ApplicationController

  def search
    if current_user.nil?
      PingSlackJob.perform_async("PackagesController - search -- q_name = #{params['q']}")
    end

    @q = Package.ransack(params[:q])
    @packages = @q.
      result(distinct: true).
      order("total_downloads desc").
      paginate(:page => params[:page], :per_page => 30)

    render 'packages/index'
  end

  def index
    @q = Package.ransack(params[:q])
    @packages = @q.
      result(distinct: true).
      order("total_downloads desc").
      paginate(:page => params[:page], :per_page => 30)
  end

  def show
    @package = Package.find_by(name: params[:id])

    if current_user.nil?
      PingSlackJob.perform_async("PackagesController - show -- package_name = #{@package.name}")
    end
  end
end
