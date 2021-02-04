class SmithsonianController < ActionController::Base

  def index
    @header = 'From the Smithsonian Collections'
    @body = 'This is the Smithsonian page!'
    render template: 'layouts/standard'
  end

end
