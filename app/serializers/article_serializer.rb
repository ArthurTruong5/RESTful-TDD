class ArticleSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :content, :slug
end
