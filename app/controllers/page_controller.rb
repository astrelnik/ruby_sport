class PageController < ApplicationController
  def home
    if (!user_signed_in?)
      redirect_to action: 'login'
    end
  end

  def login
  end

  def show
    @user = User.find(:params[:id])
  end

  def register
    # render plain: params[:login_form].inspect
    @user = User.new(post_params)
    @user.save

    redirect_to @user
  end

  private def post_params
    params.require(:login_form).permit(:email, :password)
  end

end
