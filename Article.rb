require './RowAccessors.rb'

ARTICLES = JSON.parse(File.read('./data/articles.json'), symbolize_names: true)

class Article
	include RowAccessors
	
	def initialize(row)
		@row = row
	end
	
	@@all = ARTICLES.map { |row| Article.new(row) }
	@@by_id = Hash[@@all.map{ |article| [article.id, article] }]
	
	def self.all
		@@all
	end
	
	def self.find(id:)
		@@by_id[id]
	end
end
