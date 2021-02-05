class SmithsonianController < ActionController::Base

#sets default layout
layout 'standard-lookup'

  def index
    @header = 'From the Smithsonian Collections'
    stats_url = 'https://api.si.edu/openaccess/api/v1.0/stats'
    get_response = request_api(stats_url).get()
    @body = get_response.body
    render template: 'layouts/standard-lookup'
  end

  def itemLookup
    # https://api.si.edu/openaccess/api/v1.0/content/:id
    search_url = 'https://api.si.edu/openaccess/api/v1.0/search'
    get_response = request_api(search_url).get(:headers => {'q' => '# DEBUG: drums'})
    @body = get_response.body
    render template: 'layouts/standard-lookup'
  end

  def request_api(url)
    client_key_data = File.read('../.secret/smithsonian.key').chomp
    Excon.new(
      url,
      :query => {
        :api_key => "#{client_key_data.chomp}"
      },
      :debug_request => true
    )
  end
end
