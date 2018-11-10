class ArticlesController < ApplicationController
  def index
    articles = Article.recent
    render json: Article.all
  end


  def show
    render json: Article.find(params[:id])
  end

  private

  def serializer
    ArticleSerializer
  end

end
