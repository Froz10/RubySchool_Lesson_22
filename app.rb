#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

post '/visit' do


	@username  = params[:username]
	@phone     = params[:phone]
	@datetime  = params[:datetime]

	@title = 'Thank you!'
	@message = "Dear #{@username}, we'll be waiting for you at #{@datetime}"

	f = File.open './public/users.txt', 'a'
	f.write "User: #{@username}, Phone: #{@phone}, Date and time: #{@datetime}\n"
	f.close

	erb :message

end

get '/contacts' do
	erb :contacts
end

post '/contacts' do

	@email             = params[:email]
	@emailmessage      = params[:emailmessage]


	@title2 = 'Thanks for your contact'
	@message2 = "Your message has been sent to #{@email}"

	f = File.open './public/contacts.txt', 'a'
	f.write "Email: #{@email}, Message: #{@emailmessage}\n"
	f.close

	erb :contacts_post

end