class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order(id: :desc)
  end

  def new
  end

  def add
    @category = Category.new(form_params)

    if (form_params[:published_at] == '1')
      @category.published_at = Time.now
    else
      @category.published_at = nil
    end

    @category = process_image(@category, form_params[:image])

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

    if (form_params[:published_at] == '1')
      @category.published_at = Time.now
    else
      @category.published_at = nil
    end

    @category = process_image(@category, form_params[:image])

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
    params.require(:add_article_form).permit(:title, :desc, :published_at, :image)
  end

  def process_image(article, uploaded_io)
    if (uploaded_io)
      image_name = Time.now.to_i.to_s + '_' + uploaded_io.original_filename
      File.open(Rails.root.join('public', 'uploads', image_name), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      article.image = image_name
    end

    return article
  end
end
