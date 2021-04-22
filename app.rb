# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/bookmark'
require 'pg'

class BookmarkManager < Sinatra::Base
  
  configure :development do
    register Sinatra::Reloader
  end
enable :method_override
  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
    
    @bookmarks = Bookmark.all
    erb(:bookmarks)
  end
  #post '/delete' do
    #Bookmark.delete(params[:delete_bookmark])
  #  redirect('/bookmarks')
  #end
  delete '/bookmarks/:id' do
    Bookmark.delete(params[:id])
  redirect '/bookmarks'
  end
  post '/add' do
    Bookmark.create(params[:add_bookmark], params[:add_name])
    redirect('/')
  end

  run if app_file == $PROGRAM_NAME
end
