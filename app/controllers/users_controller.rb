class UsersController < ApplicationController

  def new
    @user=User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id]=@user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user=current_user
  end

  def edit
    @user=current_user
  end

  def update
    @user=current_user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  # def destroy
  #   @user=current_user
  #   @user.destroy
  #   redirect_to new_user_path
  # end

  private
  def current_user
    User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
