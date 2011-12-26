# encoding: utf-8
require 'acceptance/helper.rb'

feature 'Miscellaneous application features' do
  describe 'Application page' do
    it 'should have title' do
      visit '/'
      page.find('head > title').should have_content('Электронная РНС')
      page.find('h1').should have_content('Электронная РНС')
    end
  end
end
