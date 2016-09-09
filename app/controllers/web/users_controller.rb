module Web
  class UsersController < BaseController

    def new
      @user = User.new
    end

    def check_user
      @user = User.find_by(email: params[:email].strip)
      if @user.blank?
        # 这里是没有找到
        render json: { success: true } 
      else
        render json: { success: false }
      end
    end
    
  end
end
