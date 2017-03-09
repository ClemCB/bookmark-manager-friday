require 'sinatra/base'
require './app/helpers/dm_config'
require './lib/bookmark_manager'

ENV['RACK_ENV'] ||= 'development'

class App < Sinatra::Base

  enable :sessions

  get '/' do
    session[:bookmark_manager] = BookmarkManager.new
    redirect '/links'
  end

  get '/links' do
    @bookmarks = session[:bookmark_manager].show_bookmarks
    # @links = session[:bookmark_manager].show_links
    # @tags = session[:bookmark_manager].show_tags
    erb :links
  end

  get '/links/new' do
    erb :new
  end

  post '/links' do
    session[:bookmark_manager].add_link(params)
    redirect '/links'
  end

end
