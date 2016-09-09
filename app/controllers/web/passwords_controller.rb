module Web
  class PasswordsController < Devise::PasswordsController
  	  skip_before_action :require_no_authentication, :only => [:edit, :update]
  	  skip_before_action :assert_reset_token_passed, :only => :edit

  	  #找回密码
	  def get_password
	    _user = User.find_by_email(params[:email])
	    if _user.blank?
	      render_fail("This email is not found in iChemical, please check if it's accurate.", errors: { code: "This email is not found in iChemical, please check if it's accurate." } )
	    else
	       unless _user.is_active?
	         render_fail("Your account is suspended, please contact customer support for reactivation.", errors: { code: "Your account is suspended, please contact customer support for reactivation."} )
	       else
             _user.send_user_mail(1)
             render_success("An email is sent to you.", errors: { code: "An email is sent to you."} )
	       end
	    end
	  end

	  def find_email
	    company_info=params[:company_info]
	    _users = User.joins(:company).select("email").where(["companies.name like :company_info or users.name like :company_info or users.telephone like :company_info or users.mobile  like :company_info",{:company_info=>"%#{company_info}%"}]).limit(2)
	    unless _users.blank?
	      render :json=> _users.to_json
	    else
	      render :json=> nil
	    end
	  end

      # 检测邮件是否存在
	  def check_email
        company_info=params[:company_info]
	    _users = User.joins(:company).select("email").where("users.email = ?",company_info).limit(2)
	    unless _users.blank?
	      render :json=> _users.to_json
	    else
	      render :json=> nil
	    end
	  end

	  # GET /resource/password/edit?reset_password_token=abcdef
	  def edit
	    super
	  end

	  # PUT /resource/password
	  def update
	    # super
	  self.resource = resource_class.reset_password_by_token(resource_params)
	  yield resource if block_given?
	    if resource.errors.empty?
	      resource.unlock_access! if unlockable?(resource)
	      resource.state = 1
	      flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
	      set_flash_message(:notice, flash_message) if is_flashing_format?
	      sign_in(resource_name, resource)
	      respond_with resource, location: after_resetting_password_path_for(resource)
	    else
	      respond_with resource
	    end
	  end

	  def render_success(msg = nil, data = {})
	    render :json => {
	               success: true,
	               message: msg.to_s
	           }.merge(data)
	  end

	  def render_fail(msg = nil, data = {})
	    render :json => {
	               success: false,
	               message: msg.to_s
	           }.merge(data)
	  end

	  protected

	  def require_no_authentication
	    return super
	  end

	  def assert_reset_token_passed
	    if params[:reset_password_token].blank?
	        set_flash_message(:error, :no_token)
	        redirect_to new_session_path(resource_name)
	    end
	  end

	  def after_resetting_password_path_for(resource)
	    super(resource)
	  end

  end
end
