class Recipe
  include HTTParty

  key_value = ENV['FOOD2FORK_KEY'] || 'd8fbd4c3c4cb770702ab76141caa4ded'
  host_port = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'

  base_uri "http://#{host_port}/api"
  default_params key: key_value
  format :json

  def self.for search
    get('/search', query: {q: search}) ['recipes']
  end
end
