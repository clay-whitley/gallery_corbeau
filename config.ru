$stdout.sync = true

set :app_file, __FILE__

configure do
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET'] || 'this is a secret shhhhh'

  set :views, File.join(Sinatra::Application.root, "lib", "views")
end

run Sinatra::Application