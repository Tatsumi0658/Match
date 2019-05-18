class UsersController < ApplicationController
  before_action :set_user, only:[:edit, :update, :show, :destroy]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.age = @user.age.to_i
    if @user.save
      redirect_to users_path, notice:"作成しました"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice:"更新しました"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice:"削除しました"
  end

  private

  def user_params
    params.require(:user).permit(:name, :sex, :age, :birth, :status, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
