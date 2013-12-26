require 'sinatra'
require 'itunes'

SITE_TITLE = "quickTunes"
SITE_DESCRIPTION = "the simple way to search iTunes"

itunes = ITunes::Client.new

def initialize
	@num_results = 5
end

get '/' do
	erb :home
end

get '/search' do
	query = params[:query]
	@results = itunes.music(query, :limit => @num_results) # returns a Hashie
	erb :results
end