require "rubygems"
require "require_all"
require "pry"
require "open-uri"
require "nokogiri"
require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
require 'json'

Capybara.default_driver = :poltergeist
Capybara.run_server = false
options = {js_errors: false}
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, options)
end
require_all "./lib/"
