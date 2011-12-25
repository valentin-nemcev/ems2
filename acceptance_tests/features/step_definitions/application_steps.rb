# encoding: utf-8
When /^I open the application$/ do
  visit '/'
end

Then /^I should see application name in window title$/ do
  page.find('head > title').should have_content('Электронная РНС')
end

Then /^I should see application name in application title$/ do
  page.find('h1').should have_content('Электронная РНС')
end
