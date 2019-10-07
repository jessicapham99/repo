class Article2sController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  layout 'special';
  # GET /article2s
  # GET /article2s.json
  def index
    @categories = Category.all
    @article2s = Article.all
  end

  # GET /article2s/1
  # GET /article2s/1.json
  def show
    @article= Article.where(:id => params[:id])
    # name=@article.(:name)
    @articles = Article.where(" name like :name ", name: @article.name)
    @categories = Category.all
    @comment=Comment.where("article_id = :id and id = parent_comment_id", id: params[:id])

    @commentc=Comment.where(:parent_comment_id=> @comment.ids).offset(1)
    # , :parent_comment_id => :id  :article_id => params[:id],
  end

  # GET /article2s/new
  def new
    @categories = Category.all
    @article2 = Article.new
  end

  # GET /article2s/1/edit
  def edit
    @categories = Category.all
  end

  # POST /article2s
  # POST /article2s.json
  def create
    @article2 = Article.new(article2_params)

    respond_to do |format|
      if @article2.save
        format.html { redirect_to @article2, notice: 'Article2 was successfully created.' }
        format.json { render :show, status: :created, location: @article2 }
      else
        format.html { render :new }
        format.json { render json: @article2.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /article2s/1
  # PATCH/PUT /article2s/1.json
  def update
    respond_to do |format|
      if @article2.update(article2_params)
        format.html { redirect_to @article2, notice: 'Article2 was successfully updated.' }
        format.json { render :show, status: :ok, location: @article2 }
      else
        format.html { render :edit }
        format.json { render json: @article2.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /article2s/1
  # DELETE /article2s/1.json
  def destroy
    @article2.destroy
    respond_to do |format|
      format.html { redirect_to article2s_url, notice: 'Article2 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article2 = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article2_params
      params.require(:article).permit(:name, :category_id, :image, :descript, :create_time)
    end
end
