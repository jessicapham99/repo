class ArticlesController < ApplicationController
  layout 'admin'
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    # if params[:tag]
    #   @articles = Article.tagged_with(params[:tag])
    # else
    #   @articles = Article.all
    # end
if(params[:search])
    @articles = Article
                    .where(Article.arel_table[:name].matches(params[:search].downcase))
                   .order(created_at: :desc).paginate(page:params[:page], per_page: 6 )
    # User.where(User.arel_table[:name].lower.matches("Bob".downcase))
    # .find(:first, :conditions => ['name ~* ?', params[:search]])
else
  @articles = Article.all
                  .order(created_at: :desc).paginate(page:params[:page], per_page: 6 )
end
    # a=0
    # p = (Article.count)/6.0
    # @articles = pages(a)
    # if p.class == 1.class
    #   @pa = Array(1..p)
    # else
    #   p=p+1
    #   @pa = Array(1..p)
    # end
  # end
  # def pages(a)
  #   Article.page(a).per(6)
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
    @article.create_time = Time.now
    # @article.image = params[:image] # Assign a file like this, or

# like this

    # File.open()
#     File.open('somewhere') do |f|
#       @article.image = f
#     end
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
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
      params.require(:article).permit(:name, :category_id, :image, :descript, :create_time)
    end
end
