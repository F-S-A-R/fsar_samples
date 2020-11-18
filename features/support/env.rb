require 'rspec' #for page.shoud etc
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'pry'
require 'webdrivers'
require 'httparty'
#get IP of host which has 4444 mapped from other container
docker_ip = %x(/sbin/ip route|awk '/default/ { print $3 }').strip

Capybara.register_driver :docker_chrome do |app|
  Capybara::Selenium::Driver.new(app,
                                 :browser => :remote,
                                 :desired_capabilities => :chrome,
                                 :url => "http://#{docker_ip}:4444/wd/hub")
end

Capybara.configure do |config|
  config.run_server = false
  if docker_ip.empty?
    config.default_driver = :selenium_chrome
  else
    config.default_driver = :docker_chrome
  end
  config.app_host = 'http://localhost:3044' # change this to point to your application
end
