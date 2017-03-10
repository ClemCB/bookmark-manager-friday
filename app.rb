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

  get '/tags/bubbles' do
    tag = Tag.first(name: 'bubbles')
    p @bookmarks = session[:bookmark_manager].show_bookmarks
    p @bookmarks.each { |k, v| k[:tags] == tag }
    # @bookmarks = tag ? tag.links : []

    # #if @bookmarks[:tags].each { |value| value.to_s == tag.to_s}
    #   "hello"
    # else
    #   []
    # end
    # p 'hello'
    # p tag
    erb :links
    end

end
