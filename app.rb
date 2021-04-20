require "sinatra"
require "sinatra/reloader"
require_relative "./lib/bookmark"
require "pg"

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    erb(:index)
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.all
    erb(:bookmarks)
  end

  post '/add' do
    Bookmark.create(params[:add_bookmark])
    redirect('/')
  end

  run if app_file == $0
end
