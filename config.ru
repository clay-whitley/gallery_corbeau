$stdout.sync = true

set :app_file, __FILE__

configure do
  set :views, File.join(Sinatra::Application.root, "lib", "views")
end

run Sinatra::Application