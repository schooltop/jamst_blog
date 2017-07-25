class BlogsController < ApplicationController
  layout 'blog'
  
  def index
    @articles = Article.all.page(params[:page]).per(9)
  end

  def show
    @article = Article.find(params[:id])
    @article.update(view_count: @article.view_count.to_i + 1)
  end

  def top_search
    @articles = Article.where("title like '#{params[:title]}%' ").page(params[:page]).per(9)
    render "index"
  end

end	