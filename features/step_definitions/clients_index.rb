Given(/^there's a client named "(.*?)" and with description "(.*?)"$/) do |name, description|
  FactoryGirl.create(:client, name: name, description: description)
end

When(/^I am on the clients index page$/) do
  visit clients_path
end

Then(/^I should see the client named "(.*?)"$/) do |name|
  @client = Client.find_by_name(name)

  page.should have_content(@client.name)
  page.should have_content(@client.description)
end