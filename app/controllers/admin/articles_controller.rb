class Admin::ArticlesController < Admin::BaseController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  layout 'admin'

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all.page(params[:page]).per(9)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        create_attachment
        format.html { redirect_to :action=>"index" }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_attachment
    unless params[:draft_img].blank?
      attachment = Attachment.create(attachment_entity_type: "Article",attachment_entity_id: @article.id, path: params[:draft_img], created_by: 1 ) 
      @article.cover_img = attachment.id
      @article.save
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        create_attachment
        format.html { redirect_to :action=>"index" }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_image
    attachment = Attachment.create(attachment_entity_type: "Article", path: params[:wang_editor_file], created_by: 1 )
    render plain: attachment.path
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:category_id,:title,:content,:cover_img)
    end
end
