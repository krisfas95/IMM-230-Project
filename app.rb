require 'sinatra'
require 'datamapper'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

get '/' do
    return 'Hello world'
end

print "What's your first name?"
first_name=gets.chomp
first_name.capitalize!
puts "Hello #{first_name}"

get '/hello/' do
	erb :hello_form
end

get '/hello/' do
    greeting = params[:greeting] || "Hi There"
    erb :index, :locals => {'greeting' => greeting}
end


delete '/:id' do
 n = params[:id]
 params[:id].to_i
 redirect '/'
end