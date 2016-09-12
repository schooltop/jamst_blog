class Admin::BaseController < ApplicationController
    protect_from_forgery with: :exception
    layout "admin"
    respond_to :html
    before_action :authenticate_employee!

    #before_action :authenticate_employee! ,:only => [:init_menu]
    #before_action :init_menu  
    #skip_before_action :authenticate_employee!, :only => [:raise_not_found!,:render_ar_error, :render_error, :render_access_denied]

     # 初始化菜单
    # def init_menu
    #   @left_sidebar = []
    #   unless current_employee.blank?
    #     # Rails.cache.delete("current_employee_#{current_employee.id}".to_sym)
    #     if Rails.cache.read("current_employee_#{current_employee.id}".to_sym).blank?
    #       #puts "#{current_employee.id.to_s}"+'查询缓存'
    #       menu_array = current_employee.is?("admin") ? Permission.sidebar_menu : Permission.sidebar(current_employee)
    #       Rails.cache.write("current_employee_#{current_employee.id}".to_sym, menu_array)
    #       @left_sidebar = menu_array
    #     else
    #       # puts "#{current_employee.id.to_s}"+'命中缓存'
    #       @left_sidebar = Rails.cache.fetch("current_employee_#{current_employee.id}".to_sym)
    #     end
    #   end
    # end
end
