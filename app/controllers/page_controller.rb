class PageController < ApplicationController
  def home
    if (!user_signed_in?)
      redirect_to action: 'login'
    end
  end

  def login
  end
end
