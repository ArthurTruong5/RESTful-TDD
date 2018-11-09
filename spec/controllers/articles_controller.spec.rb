require 'rails_helper'

describe ArticlesController do
  describe '#index' do
    it 'should return success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    # checks the body of the response
    it 'should return proper json' do
      # creates 2 articles - factory bot
      # TODO refactor
      create_list :article, 2
      get :index
      json = JSON.parse(response.body)
      json_data = json['data']
      expect(json_data.length).to eq(2)
      expect(json_data[0]['attributes']).to eq({ "title" => "My Article 1", "content" => "The content 1", "slug" => "my-article 1"})
      expect(json_data[1]['attributes']).to eq({ "title" => "My Article 2", "content" => "The content 2", "slug" => "my-article 2"})
    end
  end
end
