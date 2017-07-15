class BlogsController < ApplicationController
  def index
    @html_title = "schooltop blog"
    @bar_type = 'bar_two'
    @category_id = params[:category_id]
    if @category
      @news_list = Article.where(category_id:@category_id).order(id: :desc).page(params[:page]).per(9)
    else
      @news_list = Article.all.order(id: :desc).page(params[:page]).per(9)
    end
    @second_menu_type = 'news'
  end

  def show
    @second_menu_type = 'news'
    @bar_type = 'bar_two'
    @news = Article.find(params[:id])
    if @news.present?
      @news.update_attributes(view_count:  @news.view_count.to_i+1)

      @_next_obj = Article.where("id > ? ",@news.id).first
      @_pre_obj = Article.where("id < ? ",@news.id).last
    end
  end
end	