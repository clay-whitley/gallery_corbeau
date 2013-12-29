get '/login' do
  erb :"auth/login"
end

post '/login' do
  if params["user"] == ENV["LOGIN"] && params["pass"] == ENV["PASSWORD"]
    session[:login] = true
    redirect '/'
  end
  redirect '/'
end

get '/logout' do
  session[:login] = false
  redirect '/'
end