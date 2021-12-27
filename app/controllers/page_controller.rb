class PageController < ApplicationController
  def home
    @articles = Article.getPublished()

    if (!user_signed_in?)
      redirect_to user_session_path
    end
  end

  def login
    if (user_signed_in?)
      redirect_to home_path
    end
  end
end
