# Ruby Interview Task

Download this repository.  The `data` directory contains 2 JSON files, `articles.json` and `users.json`.

For `articles`, each hash in the file contains:
* id (a unique integer)
* concepts (an array of short tag-like strings, which are the concepts that the article is about. The same concept can appear in many different articles.)
* possibly other fields such as title, content, etc., which aren’t directly relevant to the test

For `users`:
* id (a unique integer)
* read_article_ids (an array of the ids of articles that the user has read)
* possibly other fields such as first_name, last_name, email, etc., which aren't directly relevant to the test

Can you do the following?
* write classes `Article` and `User`
    * objects of both classes should have an idmethod
    * User objects should have a read_article_ids method
    * Article objects should have a concepts method
* write class methods Article.all and User.all that will produce the expected arrays of the corresponding objects
* write methods Article.find(id:) and User.find(id:) that will quickly instantiate the indicated element
* add a User.read_articles method that will return Article objects

The following Ruby should help you parse the files:
```
require 'json'
USERS = JSON.parse(File.read('./data/users.json'), symbolize_names: true)
ARTICLES = JSON.parse(File.read('./data/articles.json'), symbolize_names: true)
```
This will create 2 global constant arrays, each of which is a hash with the following keys above.

Feel free to write any other code or global constants etc. that you feel might help.

## Further work

Following this general line of development, we would like to see how close you can get to these goals:

* What are a user’s favourite concepts?
* Can you work out a way to recommend an article to the user, that
    * the user hasn’t read
    * most closely matches the user’s interests

# Notes:

Obviously, concepts which come up most often in a user’s read articles will be concepts the user is most interested in.

Each of an article's concepts could be of equal weight – and code which treats them this way is fine. 

But if you want to get fancy, consider the possibility that the concepts most relevant to an article appear closest to the beginning of the article's concepts array
