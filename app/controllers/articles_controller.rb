class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new

  end

  def add
    @article = Article.new(form_params)

    if (form_params[:published_at] == '1')
      @article.published_at = Time.now
    else
      @article.published_at = nil
    end

    if(@article.save())
      redirect_to articles_show_path(@article.id)
    else
      render('new')
    end
  end

  def edit
    begin
      @article = Article.find(params[:id])
    rescue
      @article = false
    end
  end

  def update
    @article = Article.find(params[:id])
    @article.title = form_params[:title]
    @article.desc = form_params[:desc]

    if (form_params[:published_at] == '1')
      @article.published_at = Time.now
    else
      @article.published_at = nil
    end

    uploaded_io = form_params[:image]
    if (uploaded_io)
      image_name = Time.now.to_i.to_s + '_' + uploaded_io.original_filename
      File.open(Rails.root.join('public', 'uploads', image_name), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      @article.image = image_name
    end

    if(@article.save)
      redirect_to articles_show_path(@article.id)
    else
      render('edit')
    end
  end

  def show
    begin
      @article = Article.find(params[:id])
    rescue
      @article = false
    end
  end

  def delete
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
  def form_params
    params.require(:add_article_form).permit(:title, :desc, :published_at, :image)
  end
end
