class Admin::BaseController < ActionController::Base
    protect_from_forgery with: :exception
    layout "admin"
    respond_to :html
    before_action :authenticate_employee!
end
