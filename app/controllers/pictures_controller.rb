class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Picture.all
    render :layout => false
  end

  def show
  end

  def new
    @article = Picture.new
  end

  def edit
  end

  def create
    @picture = Picture.new(picture_params)
    respond_to do |format|
      if @article.save
        commit_attachement_ids = params[:commit_attachement_ids].present? ? params[:commit_attachement_ids].split(",") : []
        Attachment.where(id:commit_attachement_ids).update_all(attachment_entity_id:picture.id)
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(picture_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # 异步保存图片
  def upload_image
    if params[:attachment_entity_id] 
      new_attachment = Attachment.create({attachment_entity_type: "Picture", path: params[:draft_img], created_by: 1, attachment_entity_id:params[:attachment_entity_id]})
    else
      new_attachment = Attachment.create({attachment_entity_type: "Picture", path: params[:draft_img], created_by: 1})
    end  
    had_attachement_ids = params[:had_attachement_ids].present? ? params[:had_attachement_ids].split(",") : []
    @had_attachement_ids = had_attachement_ids << new_attachment.id

    @new_problem_message_images = Attachment.where(id:@had_attachement_ids)
    @attachement_ids = @had_attachement_ids.join(",")

    respond_to do |format|
      format.js  
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @article = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:category_id,:name)
    end
end
