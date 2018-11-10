module JsonApiHelpers

  def json
    json = JSON.parse(response.body)
  end

  def json_data
    json_data = json['data']
  end

end
