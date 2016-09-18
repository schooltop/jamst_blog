class BlogsController < ApplicationController
  def index
    @articles = Article.all
    render :layout=>false
  end
end	