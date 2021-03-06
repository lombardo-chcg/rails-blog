class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "bob", password: "bob", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    get_article_by_params
  end

  def new
    @article = Article.new
  end

  def edit
    get_article_by_params
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    get_article_by_params

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    get_article_by_params.destroy

    redirect_to articles_path
  end

  private
  def get_article_by_params
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :author_full_name)
  end
end
