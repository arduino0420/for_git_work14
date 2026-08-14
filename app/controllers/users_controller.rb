class UsersController < ApplicationController
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :login_required, only: [:new, :create]

  def new
    @user = User.new
  end

  def show
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      reset_session
      session[:user_id] = @user.id

      flash[:notice] = "アカウントを登録しました"
      redirect_to tasks_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "アカウントを更新しました"
      redirect_to user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    reset_session

    flash[:notice] = "アカウントを削除しました"
    redirect_to new_session_path
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end

  def correct_user
    @user = User.find(params[:id])

    unless current_user?(@user)
      redirect_to user_path(current_user),
                  alert: "ほかのユーザーのページは操作できません"
    end
  end
end