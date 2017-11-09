class PackagesController < ApplicationController

  def search
    name = params[:q_name]
    @packages = Package.where("name ILIKE ?", "%#{name}%")
    render "packages/index"
  end

  def show
    @package = Package.find(params[:id])
  end
end
