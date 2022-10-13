require 'json'
require './Article.rb'
require './User.rb'

user = User.find id: 1

r = user.recommended_article

puts user.favourite_concepts
puts ""
puts r.concepts
