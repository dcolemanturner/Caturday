require "sinatra"
require "sinatra/activerecord"
require 'json'
 
set :database, "sqlite3:///blog.db"
 
class Post < ActiveRecord::Base
end

get "/" do
  #content_type :json
  #@post.to_json
  @posts = Post.order("created_at DESC")
  erb :"posts/index"

end


get "/json" do
  content_type :json
  #@post.to_json
  @posts = Post.order("created_at DESC").to_json

  #erb :"posts/index"

end

helpers do
  # If @title is assigned, add it to the page's title.
  def title
    if @title
      "#{@title} -- My Blog"
    else
      "My Blog"
    end
  end
 
  # Format the Ruby Time object returned from a post's created_at method
  # into a string that looks like this: 06 Jan 2012
  def pretty_date(time)
   time.strftime("%d %b %Y")
  end
 
end