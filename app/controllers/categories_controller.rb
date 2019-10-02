class CategoriesController < ApplicationController
  layout 'special';
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all

    @comment=Comment
                 .connection
                 .select_all(%Q{SELECT  count(article_id) as 'count',comments.article_id,
                          articles.name, articles.descript, articles.image, categories.name as 'catename'
                          FROM comments join articles on comments.article_id=articles.id
                          join categories on categories.id=articles.category_id
                          group by comments.article_id order by count desc limit 1})
    @comment1=Comment
                  .connection
                  .select_all(%Q{SELECT  count(article_id) as 'count',comments.article_id,
                          articles.name, articles.descript, articles.image, categories.name as 'catename'
                          FROM comments join articles on comments.article_id=articles.id
                          join categories on categories.id=articles.category_id
                          group by comments.article_id order by count desc limit 1 offset 1})
    @comment2=Comment
                  .connection
                  .select_all(%Q{SELECT  count(article_id) as 'count',comments.article_id,
                          articles.name, articles.descript, articles.image, categories.name as 'catename'
                          FROM comments join articles on comments.article_id=articles.id
                          join categories on categories.id=articles.category_id
                          group by comments.article_id order by count desc limit 1 offset 2})
    @articles = Article.all.order(create_time: :desc).limit(3)
  end
def dem(a)
  Comment
      .connection
      .select_all(%Q{SELECT  count(article_id) as 'count',comments.article_id,
                          articles.name, articles.descript, articles.image, categories.name as 'catename'
                          FROM comments join articles on comments.article_id=articles.id
                          join categories on categories.id=articles.category_id
                          where categories.id ='a'
                          group by comments.article_id order by count desc })

  Comment.includes(article: [:category]).where(:category_id => @category.id).group(:articles_id).order(:count_all).size
end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @categories = Category.all
    @article = Article.where(:category_id => @category.id).order(create_time: :desc).limit(1)
    @articles = Article.where(:category_id => @category.id).order(create_time: :desc).limit(3).offset(1)
    @comment=Comment
                 .connection
                 .select_all(%Q{SELECT  count(article_id) as 'count',comments.article_id,
                          articles.name, articles.descript, articles.image, categories.name as 'catename'
                          FROM comments join articles on comments.article_id=articles.id
                          join categories on categories.id=articles.category_id

                          group by comments.article_id order by count desc})
  end

  # GET /categories/new
  def new
    @categories = Category.all
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
    @categories = Category.all
  end

  # POST /categories
  # POST /categories.json
  def create

    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :descript)
    end
end
