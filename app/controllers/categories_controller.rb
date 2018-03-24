class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    authenticate_user!

    @category = Category.new
  end

  def create
    authenticate_user!

    @category = Category.new(permitted_params)

    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    authenticate_user!
    @category = Category.find(params[:id])
  end

  def update
    authenticate_user!
    @category = Category.find(params[:id])

    if @category.update_attributes(permitted_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    authenticate_user!
  end

  private

  def permitted_params
    params.require(:category).permit!
  end

end
