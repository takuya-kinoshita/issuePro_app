class CategoriesController < ApplicationController
  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.name = params[:name]
    if @category.update(category_params)
      redirect_to categories_path
    else
      render "edit"
    end
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      redirect_to "/categories"
    else
      render "/new"
    end
  end

  def show
    @category = Category.find(params[:id])
    #debugger
    @boards = @category.boards.paginate(page: params[:page], per_page: 20)
    #debugger
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:danger] = "カテゴリーを削除しました"
      redirect_to categories_path
    else
      render "edit"
    end
  end


  private
  def category_params
    params.require(:category).permit(:name)
  end
end
