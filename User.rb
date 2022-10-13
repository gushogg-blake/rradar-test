require './RowAccessors.rb'

USERS = JSON.parse(File.read('./data/users.json'), symbolize_names: true)

class User
	include RowAccessors
	
	def initialize(row)
		@row = row
	end
	
	@@all = USERS.map { |row| User.new(row) }
	@@by_id = Hash[@@all.map{ |user| [user.id, user] }]
	
	def self.all
		@@all
	end
	
	def self.find(id:)
		@@by_id[id]
	end
	
	def read_articles
		@row[:read_article_ids].map{ |id| Article.find id: id }
	end
	
	def favourite_concepts
		concept_occurrences = {}
		
		read_articles.each do |article|
			article.concepts.each do |concept|
				if not concept_occurrences.key? concept
					concept_occurrences[concept] = 0
				end
				
				concept_occurrences[concept] += 1
			end
		end
		
		concept_occurrences_array = concept_occurrences.map{ |key, value| {
			:concept => key,
			:occurrences => value,
		}}
		
		sorted = concept_occurrences_array.sort_by{ |h| h[:occurrences] }.reverse!
		
		sorted.map{ |h| h[:concept] }
	end
	
	def recommended_article
		unread_articles = Article.all.select{ |article| !read_articles.include? article }
		
		favourite_concepts.each do |concept|
			matching_article = unread_articles.find{ |article| article.concepts.include? concept }
			
			if matching_article
				return matching_article
			end
		end
		
		nil
	end
end
