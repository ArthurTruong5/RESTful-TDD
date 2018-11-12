require 'rails_helper'

describe ArticlesController do
  describe '#index' do
    subject { get :index}
    it 'should return success response' do
      subject
      expect(response).to have_http_status(:ok)
    end

    # checks the body of the response
    it 'should return proper json' do
      # creates 2 articles - factory bot
      create_list :article, 2
      subject
      expect(json_data.length).to eq(2)
      article_test = Article.recent
      Article.recent.each_with_index do |article, index|
      expect(json_data[index]['attributes']).to eq({ "title" => article.title, "content" => article.content, "slug" => article.slug})
      end
    end

    it 'should return articles in the proper order' do
      # use factory bot - using create helper
      old_article = create :article
      newer_article = create :article
      subject
      # want to check if the first object is the recent article
      expect(json_data.first['id']).to eq(newer_article.id.to_s)
      # check to see if its the old article
      expect(json_data.last['id']).to eq(old_article.id.to_s)

    end
  end
end
