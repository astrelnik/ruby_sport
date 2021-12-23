class ArticlesController < ApplicationController
  def index

  end

  def new

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
    @article.save()

    redirect_to articles_show_path(@article.id)
  end

  private def form_params
    params.require(:add_article_form).permit(:title, :desc)
  end
end
