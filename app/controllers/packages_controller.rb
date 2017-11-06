class PackagesController < ApplicationController

  def search
    name = params[:q_name]
    @packages = Package.where("name ILIKE ?", "%#{name}%")
    render "packages/index"
  end

  # def show
  #   @package = Pacakge.find_by(name: params[:name])
  #   render "packages/show"
  # end
end
