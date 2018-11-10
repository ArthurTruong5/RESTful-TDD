class ApplicationController < ActionController::Base


  def render(options={})
    options[:json] = serializer.new(options[:json])
    super(options)
  end


end
