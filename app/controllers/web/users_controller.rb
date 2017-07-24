module Web
  class UsersController < BaseController
    
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
