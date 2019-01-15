require 'sinatra'
require 'sqlite3'

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




post '/hello/' do
	greeting = params [:greeting] || "HI there"
	employee_name = params [:name]

	# create database 
	db = SQLite3::Database.open "hw.db"

	# insert greeting and name 
	db.execute "insert into employees (name, greeting) values (‘#{employee_name}’, '#{greeting}')"


	db.close

end

