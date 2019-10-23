require "rubygems"
require 'bundler'
Bundler.require(:default)
Bundler.require(Sinatra::Base.environment)
require "active_support/deprecation"
require "active_support/all"

ActiveRecord::Base.establish_connection(
    :adapter => 'postgresql',
    :database => 'rewards_development'
)
require_all 'app'

