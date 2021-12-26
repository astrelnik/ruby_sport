class ArticlesController < ApplicationController
  def index
    @articles = Article.all

    # abort @articles.inspect
  end

  def new

  end

  def edit
    begin
      @article = Article.find(params[:id])
      # abort @article.inspect
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

  def add
    # render plain: params[:add_article_form].inspect
    @article = Article.new(form_params)

    if(@article.save())
      redirect_to articles_show_path(@article.id)
    else
      render('new')
    end
  end

  def delete
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private def form_params
    params.require(:add_article_form).permit(:title, :desc, :published_at)
  end
end
