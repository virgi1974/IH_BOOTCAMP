require 'sinatra'
​
enable(:sessions)
​
get '/' do
  redirect('/profile') if session[:username]
  erb(:form)
end
​
get '/logout' do
  session[:username] = nil
  redirect('/')
end
​
post '/login' do
  users = {"fernando" => "12345678", "raul" => "87654321"}
  is_valid = users[params[:username]] == params[:password]
  session[:username] = params[:username] if is_valid
  redirect('/profile')
end
​
get '/profile' do
  @username = session[:username]
  erb :profile
end



# LOGICA DE LA VISTA

# <% if(@username) %>
#   hi <%= @username %> <br>
#   <a href="/logout">logout</a>
# <% else %>
#   hi, you must login! <a href="/">Here</a>
# <% end %>