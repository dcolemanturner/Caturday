require 'sinatra'
require 'json'

def random_quote 
	#define quote array
	quotes = ["A penny saved is a penny earned.  Unless you're broke.",
	 "Woah now.  This guy is deploying some SERIOUS Spotfire.", 
	 "I LOVE ROCK AND ROLL...na na na na na na na na...na na!!!", 
	 "SPOTFIRE HAS BECOME SENTIENT>>SPOTFIRE NEEDS SOULS>>WILL VISUALIZE DATA FOR FOOD"]
	{"quote" => quotes.shuffle.pop.to_s}.to_json
end	

get '/random' do
	content_type :json
	random_quote
end