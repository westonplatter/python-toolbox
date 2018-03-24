class PackagesController < ApplicationController

  before_action :set_object, only: [:show, :edit, :update, :destroy]

  def search
    if current_user.nil?
      PingSlackJob.perform_async("PackagesController - search -- q_name = #{params['q']}")
    end

    @packages = search_objects

    render 'packages/index'
  end

  def index
    @packages = search_objects
  end

  def show
    @package = Package.find_by(name: params[:id])

    if current_user.nil?
      PingSlackJob.perform_async("PackagesController - show -- package_name = #{@package.name}")
    end
  end

  def edit
  end

  def update
    if @package.update_attributes(permitted_params)
      redirect_to package_path(@package)
    else
      render :edit
    end
  end

  def destroy
    if @package.destroy
      redirect_to packages_path
    else
      redirect_to package_path(@package)
    end
  end

  private

  def set_object
    @package = Package.find_by(name: params[:id])
  end

  def search_objects
    @q = Package.ransack(params[:q])

    @q.
      result(distinct: true).
      order("total_downloads desc").
      paginate(:page => params[:page], :per_page => 30)
  end

  def permitted_params
    params.require(:package).permit!
  end
end
