require('bundler/setup')
require('pry')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get '/' do
  erb :index
end


###Bands###


get '/bands' do
  @bands = Band.all()
  erb(:bands)
end

get '/bands/:id' do
  id = params.fetch('id').to_i
  @band = Band.find(id)
  @venues = Venue.all()
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

post '/bands/:id/venues/new' do
  band_id = params.fetch('id').to_i
  venue_id  = params.fetch('venue_id').to_i
  band = Band.find(band_id)
  venue = Venue.find(venue_id)
  band.venues.push(venue)
  @bands = Band.all
  erb(:bands)
end

###Venues###

get '/venues' do
  @venues = Venue.all()
  erb(:venues)
end

get '/venues/:id' do
  id = params.fetch('id').to_i
  @venue = Venue.find(id)
  @bands = Band.all()
  erb(:venue)
end

post '/venues/new' do
  name = params.fetch('venue_name')
  @venue = Venue.create({name: name})
  @venues = Venue.all
  erb(:venues)
end

patch '/venues/:id/update' do
  id = params.fetch('id')
  @venue = Venue.find(id)
  name = params.fetch('venue_name', @venue.name)
  @venue.update({name: name})
  redirect("/venues/#{@venue.id}")
end

delete '/venues/:id/delete' do
  id = params.fetch('id').to_i
  venue = Venue.find(id)
  venue.destroy
  @venues = Venue.all
  erb(:venues)
end

post '/venues/:id/bands/new' do
  venue_id = params.fetch('id').to_i
  band_id  = params.fetch('band_id').to_i
  band = Band.find(band_id)
  venue = Venue.find(venue_id)
  venue.bands.push(band)
  @bands = Band.all
  @venues = Venue.all
  erb(:venues)
end
