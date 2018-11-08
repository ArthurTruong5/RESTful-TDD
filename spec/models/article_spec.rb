require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '#validations' do
    it 'should test that factory is valid' do
      expect(build :article).to be_valid
    end

    it 'should validate presence of title' do
      article = build :article, title: ''
      expect(article).not_to be_valid
      # expect(article.errors.messages[:content]).to include("can't be black")
    end

    it 'should validate presence of content' do
      article = build :article, content: ''
      expect(article).not_to be_valid
      # expect(article.errors.messages[:content]).to include("can't be black")
    end
  
  end
end
