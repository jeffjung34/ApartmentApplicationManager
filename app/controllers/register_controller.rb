class RegisterController < ApplicationController
  skip_before_action :authorize

  def new
    @user = User.new
    if current_user
      redirect_to home_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to home_url
    else 
      render :new, status: :unprocessable_entity, notice: "Unable to register"
    end
  end

  private
    def user_params
      # strong parameters
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
