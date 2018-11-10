class ArticlesController < ApplicationController
  def index
    render json: serializer.new(Article.all)
  end


  def show
    render json: serializer.new(Article.find(params[:id]))
  end

  private

  def serializer
    ArticleSerializer
  end


end
