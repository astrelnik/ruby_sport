class ArticlesController < ApplicationController
  def index

  end

  def new

  end

  def show
    @article = Article.find(params[:id])
  end

  def add
    # render plain: params[:add_article_form].inspect
    @article = Article.new(form_params)
    @article.save()
  end

  private def form_params
    params.require(:add_article_form).permit(:title, :desc)
  end
end
