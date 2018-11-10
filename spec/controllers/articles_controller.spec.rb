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
      # TODO refactor
      articles = create_list :article, 2
      subject
      expect(json_data.length).to eq(2)
      articles.each_with_index do |article, index|
      expect(json_data[index]['attributes']).to eq({ "title" => article.title, "content" => article.content, "slug" => article.slug})
      end
    end
  end
end
