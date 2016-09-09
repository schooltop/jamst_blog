module Web
  class BaseController < ApplicationController
    protect_from_forgery with: :exception
    before_filter :browse_articles_history #浏览历史记录


    # 调用cookies[:browse_articles_history]返回chemical的历史浏览序列id（从新到旧）,用/隔开,
	  def browse_articles_history
	    cookies.delete :browse_articles_history if cookies[:browse_articles_history] =~ /EBD/
	    if params[:controller] == "articles" && params[:action] == "show"
	      product_cas = params[:id]
	      if cookies[:browse_articles_history].blank?
	        history = product_cas + "/"
	        cookies[:browse_articles_history] = { value: history, expires: 20.years.from_now }
	      else
	        history_array = cookies[:browse_articles_history].split("/")
	        if history_array.size < 6
	          if history_array.include?(product_cas)
	            history_array.delete(product_cas)
	            history_array.unshift(product_cas)
	          else
	            history_array.unshift(product_cas)
	          end
	        else
	          if history_array.include?(product_cas)
	            history_array.delete(product_cas)
	            history_array.unshift(product_cas)
	          else
	            history_array.pop
	            history_array.unshift(product_cas)
	          end
	        end
	        history = history_array * "/"
	        cookies[:browse_articles_history] = { value: history, expires: 20.years.from_now }
	      end
	    end
	  end
  
  end
end
