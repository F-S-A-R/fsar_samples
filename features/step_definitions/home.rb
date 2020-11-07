Given /I am on the home page/i do
  visit '/'
end

Then(/I should see "(.*)" on the page/) do |page_text|
  expect(page).to have_content(page_text)
end