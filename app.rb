require 'sinatra'
require 'json'

def random_quote 
	#define quote array
	quotes = ["test yo", "test 2", "This is a quote", "yeeeah"]
	{"quote" => quotes.shuffle.pop.to_s}.to_json
end	

get '/random' do
	content_type :json
	random_quote
end