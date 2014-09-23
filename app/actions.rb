# Homepage (Root path)
enable :sessions

helpers do 
  def vote_count(song_id)
    votes = Vote.where("song_id = ?", song_id).count
  end
end
get '/' do
  @user = User.new
  erb :index
end

post '/login' do
  @user = User.where(
    email:   params[:email],
    password: params[:password]
    ).first
  if @user 
    session[:user_id] = @user.id
    redirect '/songs' 
  else
    redirect '/'
  end
end

get '/logout' do 
  session.clear
  redirect '/'
end

get '/signup' do
  @user = User.new
  erb :signup
end

get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

get '/songs/new' do
  @song = Song.new
  erb :'songs/new'
end

get '/songs/:id' do
  @song = song.find params[:id]
  erb :'songs/show'
end

post '/signup' do 
  @user = User.new(
    email: params[:email],
    password: params[:password]
    )
  if @user.save
    session[:user_id] = @user.id
    redirect '/songs' 
  else
    redirect '/signup'  
  end
end

post '/songs' do

  @song = Song.new(
    url:   params[:url],
    song_title: params[:song_title],
    author:  params[:author],
    user_id: session[:user_id],
  )
  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end

post '/vote' do
 vote = Vote.new(
          user_id: session[:user_id],
          song_id: params[:song_id]
  ) 
 if vote.save
  redirect '/songs'
else
  redirect '/songs'
 end
end