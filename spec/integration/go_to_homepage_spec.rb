require 'spec_helper'
feature 'Go to homepage' do
  scenario 'Go to homepage' do
    visit '/'
    page.current_path.should == root_path
    page.should have_content("Hotel Specials")
    page.should have_selector('table tr')
  end
end
