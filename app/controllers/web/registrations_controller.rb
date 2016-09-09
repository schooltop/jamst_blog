# coding: utf-8
module Web
  class RegistrationsController < Devise::RegistrationsController

    def new
      @user = User.new
      super
    end

    def create
      if User.find_by(email: user_params[:email])
        redirect_to new_user_registration_url(user_params.merge({error: '*Email existed'})) and return
      else
        @user = User.build(user_params)
        if @user.save
          sign_in(@user)
          redirect_to :back
        else
          render :new
        end
      end  
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :mobile)
    end

  end
end
