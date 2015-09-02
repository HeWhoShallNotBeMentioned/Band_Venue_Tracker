require('bundler/setup')
require('pry')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get '/' do
  erb :index
end

get '/bands' do
  @bands = Band.all()
  erb(:bands)
end

post '/bands/new' do
  name = params.fetch('band_name')
  @band = Band.create({name: name})
  @bands = Band.all
  erb(:bands)  
end
