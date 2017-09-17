require 'sinatra'

def page_content(title)
  File.read("pages/#{title}.txt")
rescue Errno::ENOENT
  return 'Not found'
end

get '/' do
  'Hi'
  erb :index
end

get '/:title' do
  @title = params[:title]
  @content = page_content(@title)
  erb :show
end
end
