require 'spec_helper'
feature 'Search Hotel Deals' do
  scenario 'Search for hotel deals in Seattle' do
    visit '/'
    fill_in "city", :with => "Seattle"
    click_button "Search Hotel Specials"

    page.should have_selector('table tr')
    page.should have_content("Seattle")
  end

  scenario 'Search for hotel deals in Norman, OK' do
    visit '/'
    fill_in "city", :with => "Norman"
    fill_in "province", :with => "OK"
    click_button "Search Hotel Specials"

    page.should have_selector('table tr')
    page.should have_content("Norman")
    page.should have_content("OK")
  end

  scenario 'Search for hotel deals in Czech Republic' do
    visit '/'
    fill_in "country_code", :with => "CZE"
    click_button "Search Hotel Specials"

    page.should have_selector('table tr')
    page.should have_content("CZE")
  end

  scenario 'Search for hotel deals in London with minimum 3 stars and max total rate of $300' do
    visit '/'
    fill_in "city", :with => "London"
    fill_in "country_code", :with => "GBR"
    fill_in "max_rate", :with => "500"
    fill_in "minimum_stars", :with => "3"
    click_button "Search Hotel Specials"

    page.should have_selector('table tr')
    page.should have_content("London")
    page.should have_content("GBR")
  end

  scenario 'Search for hotel deals in Paris for certain dates all inclusive' do
    visit '/'
    fill_in "city", :with => "Paris"
    fill_in "country_code", :with => "FRA"
    fill_in "from_date", :with => "2013/11/1"
    fill_in "to_date", :with => "2014/02/25"
    click_button "Search Hotel Specials"

    page.should have_selector('table tr')
    page.should have_content("Paris")
    page.should have_content("FRA")
  end
end
