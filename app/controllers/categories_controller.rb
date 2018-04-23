class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new(name: params[:name])
  end

  def create
    @category = Category.new(name: params[:category][:name])

    if @category.save
      flash[:success] = "Category added successfully"
      redirect_to products_path
    else
      flash.now[:failure] = "Validations Failed"
      render :new, status: :bad_request
    end
  end

  def show
    @category = Category.find_by(id: params[:id])
  end
end
