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

get '/bands/:id' do
  id = params.fetch('id').to_i
  @band = Band.find(id)

  erb(:band)
end

post '/bands/new' do
  name = params.fetch('band_name')
  @band = Band.create({name: name})
  @bands = Band.all
  erb(:bands)
end

patch '/bands/:id/update' do
  id = params.fetch('id')
  @band = Band.find(id)
  name = params.fetch('band_name', @band.name)
  @band.update({name: name})
  redirect("/bands/#{@band.id}")
end

delete '/bands/:id/delete' do
  id = params.fetch('id').to_i
  band = Band.find(id)
  band.destroy
  @bands = Band.all
  erb(:bands)
end
