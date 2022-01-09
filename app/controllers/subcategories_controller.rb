class SubcategoriesController < ApplicationController
  def index
    @subcategories = Subcategory.all.order(id: :desc)
  end

  def new
    @categories = Category.all
  end

  def add
    @subcategory = Subcategory.new(form_params)

    if(@subcategory.save())
      redirect_to subcategories_show_path(@subcategory.id)
    else
      render('new')
    end
  end

  def edit
    @categories = Category.all
    begin
      @subcategory = Subcategory.find(params[:id])
    rescue
      @subcategory = false
    end
  end

  def update
    @subcategory = Subcategory.find(params[:id])

    if(@subcategory.update(form_params))
      redirect_to subcategories_show_path(@subcategory.id)
    else
      render('edit')
    end
  end

  def show
    begin
      @subcategory = Subcategory.find(params[:id])
    rescue
      @subcategory = false
    end
  end

  def delete
    @subcategory = Subcategory.find(params[:id])
    @subcategory.destroy

    redirect_to subcategories_path
  end

  private
  def form_params
    params.require(:add_subcategory_form).permit(:category_id, :title, :desc)
  end
end
