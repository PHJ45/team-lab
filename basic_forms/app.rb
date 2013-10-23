require './environment'

module FormsLab
  class App < Sinatra::Base
    get '/' do
      @songs = Song.all
      erb :'songs/index'
    end

    get '/songs/:id' do  
      @song = Song[params[:id]]
      erb :'songs/show'
    end

    get '/songs/:id/edit' do
      @song = Song[params[:id]]
      # binding.pry
      erb :'songs/edit'
    end

    post '/songs/:id/update' do
      @song = Song[params[:id]]
      @song.title = params[:title]
      @song.artist = params[:artist]
      @song.genre = params[:genre]
      @song.length = params[:length]
      @song.save
      redirect '/'
    end
  end
end
