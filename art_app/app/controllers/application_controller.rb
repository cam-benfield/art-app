class ApplicationController < ActionController::Base#render

  layout 'standard'

  def index
    @header = 'Art Connections'
    @body = 'Under Construction!'
    render template: 'layouts/standard'
  end

end
