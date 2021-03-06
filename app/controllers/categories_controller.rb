class CategoriesController < ApplicationController
skip_before_action :require_login, only: [:index, :show]

  def index
    @products_by_category = Category.products_by_category
  end

  def new; end

  def create
    @category = Category.new(name: params[:category][:name])

    if @category.save
      flash[:success] = "Category added successfully"
      redirect_to merchant_path(id: @current_user.id)
    else
      flash.now[:failure] = "Validations Failed"
      render :new, status: :bad_request
    end
  end

  def show
    @category = Category.find_by(id: params[:id])
  end
end
