class PackagesController < ApplicationController

  def search
    name = params[:name]
    @packages = Package.where("name ILIKE ?", "%#{name}%")
    render "packages/index"
  end

end
