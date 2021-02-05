class SmithsonianController < ActionController::Base

# Displays total objects available to lookup
  def index
    @header = 'From the Smithsonian Collections'
    @body = stats_lookup()
  end

# Intention is to migrate to lookup
  def itemLookup
    # https://api.si.edu/openaccess/api/v1.0/content/:id
    @header = 'What would you like to search for?'
    @body = item_query()
  end

# Establish api connection with key
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

# Looks up stats
  def stats_lookup
    # TODO: private?
    stats_url = 'https://api.si.edu/openaccess/api/v1.0/stats'
    get_response = request_api(stats_url).get()
    json_response = JSON.parse(get_response.body)
    @stats_response = json_response["response"]["units"]
    render template: 'layouts/standard-stats'
  end

# Item query
  def item_query
    client_key_data = File.read('../.secret/smithsonian.key').chomp
    search_url = 'https://api.si.edu/openaccess/api/v1.0/search'
    user_query = params["q"]
    get_response = request_api(search_url).get(:query => {
      :api_key => "#{client_key_data.chomp}",
      :q => "#{user_query}"})
    json_response = JSON.parse(get_response.body)
    @items_response = json_response["response"]["rows"]
    render template: 'layouts/standard'
  end

end
