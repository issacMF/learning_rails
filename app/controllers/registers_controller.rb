class RegistersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save!
      redirect_to root_path, notice: "create successfully"
    else
      render :new
    end
  end

  private

  def user_params
    params.required(:user).permit(:email, :password, :password_confirmation)
  end
end
