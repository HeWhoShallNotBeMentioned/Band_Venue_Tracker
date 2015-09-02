require 'spec_helper'

describe(Band) do

  it { should have_and_belong_to_many(:venues) }
  it { should validate_presence_of(:name) }

  it("capitalizes the first letter of every word of the band name") do
    band = Band.create({name: 'hello world'})
    expect(band.name).to eq 'Hello World'
  end

end
