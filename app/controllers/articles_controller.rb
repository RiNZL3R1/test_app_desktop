class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
    article =Article.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    article =Article.find(params[:id])
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)#@article = Article.new(params.require(:article).permit(:title, :description))

    respond_to do |format|
      if @article.save
        #flash[:notice]="Article was successfully created." bi alt satirdakini yapabilmek  icin yazilan alternatif kod
        format.html { redirect_to @article, notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
   # @article = Article.find(params[:id])
   # if  @article.update(params.require(:article).permit(:title, :description))
   #   flash[:notice]="Article was successfully updated."
   #   redirect_to @article
   # else
   #   render 'edit'      
   # end 
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
   # @article = Article.find(params[:id])
   # @article.destroy
   # redirect_to article_path 

    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
