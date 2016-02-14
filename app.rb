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
    @memos = Memo.all
    erb :index
end

post '/create' do
        Memo.create(
        title: params[:title],
        content: params[:content]
        # category_id: params[:category]
    )
    redirect '/'
end

get '/delete/:id' do
   Memo.find(params[:id]).destroy
   redirect '/'
end

get '/edit/:id' do
    @memo = Memo.find(params[:id])
    erb :edit
end

post '/renew/:id' do
    @memo = Memo.find(params[:id])
    @memo.update({
        title: params[:title],
        content: params[:content]
    })
    redirect '/'
end