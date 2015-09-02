require 'spec_helper'

describe(Venue) do

  it { should have_and_belong_to_many(:bands) }
  it { should validate_presence_of(:name) }

  it("capitalizes the first letter of every word of the band name") do
    test_venue = Venue.create({name: 'long run'})
    expect(test_venue.name).to eq 'Long Run'
  end

end
