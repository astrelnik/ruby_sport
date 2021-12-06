class PageController < ApplicationController
  def home
    if (!user_signed_in?)
      redirect_to action: 'login'
    end
  end

  def login
  end

  def show
    @user = Category.find(:params[:id])
  end

  def register

  end
  def add_user
    # render plain: params[:login_form].inspect
    @user = Category.new(post_params)
    @user.save
  end

  def forgot

  end

  private def post_params
    params.require(:login_form).permit(:title, :desc)
  end

end
