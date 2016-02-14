require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require './models'

before do
    @my_name = '<amosuke>'
    # @categories = Category.all
end

get '/' do
    erb :index
end

post '/create' do
        Memo.create(
        title: params[:title],
        content: params[:content],
        # category_id: params[:category]
    )
    redirect '/'
end