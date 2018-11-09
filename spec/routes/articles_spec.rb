require 'rails_helper'

describe 'article routes', type: :routing do
  it 'should route to article index' do
    expect(get '/articles').to route_to ('articles#index')
  end
end
