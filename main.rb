require 'json'
require './Article.rb'
require './User.rb'

user = User.find id: 1

puts user.favourite_concepts
