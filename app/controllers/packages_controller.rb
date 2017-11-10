class PackagesController < ApplicationController

  before_action :set_package, except: [:search]

  def search
    name = params[:q_name]
    @packages = Package.where("name ILIKE ?", "%#{name}%")
    render "packages/index"
  end

  def show
  end

  private

  def set_package
    @package = Package.find_by(name: params[:id])
  end
end
