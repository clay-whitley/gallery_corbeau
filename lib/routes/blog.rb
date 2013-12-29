# Index
get '/posts' do
  @posts = Post.all
  erb :"blog/index"
end

# New
get '/posts/new' do
  ensure_auth
  erb :"blog/new"
end

# Edit
get '/posts/:id/edit' do
  ensure_auth
  @post = Post.find(params[:id])
  erb :"blog/edit"
end

# Show
get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :"blog/show"
end

# Create
post '/posts' do
  ensure_auth
  Post.create(params[:post])
  redirect '/posts'
end

# Update
put '/posts/:id' do
  ensure_auth
  post = Post.find(params[:id])
  post.update_attributes(params[:post])
  redirect "/posts/#{params[:id]}"
end

# Delete
delete '/posts/:id' do
  ensure_auth
  Post.destroy(params[:id])
  redirect '/posts'
end
