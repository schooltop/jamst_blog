class PicturesController < ApplicationController
  layout 'blog'

  def index
    @articles = Picture.all
  end

end
