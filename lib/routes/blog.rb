# Index
get '/posts' do
  @posts = Post.all
  erb :"blog/index"
end

# Show
get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :"blog/show"
end

# New
get '/posts/new' do
  erb :"blog/new"
end

# Edit
get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  erb :"blog/edit"
end

# Create
post '/posts' do
  Post.create(params[:post])
  redirect '/posts'
end

# Update
put '/posts/:id' do
  post = Post.find(params[:id])
  post.update_attributes(params[:post])
  redirect "/posts/#{params[:id]}"
end

# Delete
delete '/posts/:id' do
  Post.destroy(params[:id])
  redirect '/posts'
end
