class SessionsController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user&.authenticate(session_params[:password])
      reset_session
      session[:user_id] = user.id

      flash[:notice] = "ログインしました"
      redirect_to tasks_path
    else
      flash.now[:alert] =
        "メールアドレスまたはパスワードに誤りがあります"

      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    flash[:notice] = "ログアウトしました"
    redirect_to new_session_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end