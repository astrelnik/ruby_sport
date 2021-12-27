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

  def check_user
    # render plain: params[:login_form][:email].inspect
    @user = Person.find_by(email: params[:login_form][:email])
    if @user && @user.authenticate(params[:password])
      sessions[:user_id] = @user.id
      redirect_to home_path
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @user = Category.find(:params[:id])
  end

  def register

  end
  def add_user
    # render plain: params[:register_form].inspect
    # render plain: params[:register_form][:firstname].inspect
    @user = Person.new(post_params)

    if(@user.save)
      redirect_to email_sent_path
    else
      render('register')
    end

    # @user.firstname = params[:firstname]
    # @user.lastname = params[:lastname]
    # @user.email = params[:email]
  end

  def forgot

  end

  def password

  end

  def email_sent

  end

  private def post_params
    params.require(:register_form).permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end

end
