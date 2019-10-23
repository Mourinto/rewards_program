require 'sinatra'
require 'sinatra/activerecord'
configure :development do
  set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'rewards_development', pool: 5}
end

configure :test do
  set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'rewards_test', pool: 5}
end