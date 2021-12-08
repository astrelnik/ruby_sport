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
    render plain: params[:register_form].inspect
    # @user = Person.new(post_params)
    # @user.save
  end

  def forgot

  end

  def password

  end

  def email_sent

  end

  private def post_params
    params.require(:register_form).permit(:firstname, :lastname, :email, :password)
  end

end
