class UsersController < ApplicationController
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :login_required, only: [:new, :create]
  
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])

  if @user.update(user_params)
    flash[:notice] = "アカウントを更新しました"
    redirect_to user_path(@user)
  else
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  @user = User.find(params[:id])
  @user.destroy
  redirect_to new_user_path
end

def create
    @user = User.new(user_params)
if @user.save
  session[:user_id] = @user.id
  flash[:notice] = "アカウントを登録しました"
  redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
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
  redirect_to user_path(current_user) unless current_user?(@user)
end

end