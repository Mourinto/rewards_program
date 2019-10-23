require 'rack/test'
require 'rspec'
require 'bundler'
ENV['RACK_ENV'] = 'test'
Bundler.require(:default, :test)
require File.expand_path('../../config/environment.rb', __FILE__)

ActiveRecord::Base.establish_connection(
    :adapter => 'postgresql',
    :database => 'rewards_test'
)
FactoryBot.definition_file_paths = %w{./spec/factories}
FactoryBot.find_definitions

RSpec.configure do |config|

  config.include FactoryBot::Syntax::Methods

  require 'database_cleaner'

  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation, {:only => %w{users referral_chains}}
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each, :database) do
    DatabaseCleaner.start
  end

  config.after(:each, :database) do
    DatabaseCleaner.clean
  end
end
