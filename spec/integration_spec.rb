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


end
