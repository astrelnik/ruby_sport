class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order(id: :desc)
  end

  def new
  end

  def add
    @category = Category.new(form_params)

    if(@category.save())
      redirect_to categories_show_path(@category.id)
    else
      render('new')
    end
  end

  def edit
    begin
      @category = Category.find(params[:id])
    rescue
      @category = false
    end
  end

  def update
    @category = Category.find(params[:id])
    @category.title = form_params[:title]
    @category.desc = form_params[:desc]

    if(@category.save)
      redirect_to categories_show_path(@category.id)
    else
      render('edit')
    end
  end

  def show
    begin
      @category = Category.find(params[:id])
    rescue
      @category = false
    end
  end

  def delete
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end

  private
  def form_params
    params.require(:add_category_form).permit(:title, :desc)
  end
end
