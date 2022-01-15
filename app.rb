require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload './lib/bookmark'
    also_reload './lib/database'
  end

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.get_all
    erb :'bookmarks/index'
  end

  post '/bookmarks/add' do
    Bookmark.add(params[:page_address], params[:title])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
