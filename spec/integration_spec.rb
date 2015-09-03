require 'spec_helper'

describe('visting the home page', {:type => :feature}) do
  it("makes sure the home page is available") do
    visit("/")
    expect(page).to have_content("Welcome to the Band and Venue tracker.")
  end

  it('make sure the Band page is available') do
    visit('/')
    click_link('Bands')
    expect(page).to have_content('All Bands')
  end

  it('goes to venues page') do
    visit('/')
    click_link('Venues')
    expect(page).to have_content('All Venues')
  end

  describe 'adding a new band', type: :feature do
    it 'adds a band to database' do
      visit '/'
      click_link 'Bands'
      fill_in('band_name', with: "the sunday's")
      click_button('Add Your Band')
      expect(page).to have_content("The Sunday's")
    end

  end

  describe 'adding a new venue', type: :feature do
    it 'adds a venue to database' do
      visit '/'
      click_link 'Venues'
      fill_in('venue_name', with: "the met")
      click_button('Add Your Venue')
      expect(page).to have_content("The Met")
    end

  end


end
