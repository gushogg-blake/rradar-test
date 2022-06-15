# Ruby Interview Task

Download this repository.  The `data` directory contains 2 JSON files, `articles.json` and `users.json`.

The following Ruby should help you parse the files:

```ruby
require 'json'
USERS = JSON.parse(File.read('./data/users.json'), symbolize_names: true)
ARTICLES = JSON.parse(File.read('./data/articles.json'), symbolize_names: true)
```

This will create 2 global constant arrays to use in your code.

`ARTICLES` is an array of hashes containing:
* `id` - a unique integer
* `concepts` - an array of short tag-like strings, which are the concepts that the article is about. The same concept can appear in many different articles.

`USERS` is an array of hashes containing:
* `id` - a unique integer
* `read_article_ids` - an array of the ids of articles that the user has read

(Feel free to write any other code or global constants that you think might help or optimise your implementation.)

## Can you do the following?

* write classes `Article` and `User`
    * objects of both classes should have an `id` method
    * User objects should have a `read_article_ids` method
    * Article objects should have a `concepts` method
* write class methods `Article.all` and `User.all` that will produce the expected arrays of the corresponding objects
* write methods `Article.find(id:)` and `User.find(id:)` that will quickly instantiate the indicated element
* add a `User.read_articles` method that will return Article objects that the user has read

## Further work

Following this general line of development, we would like to see how close you can get to these goals:

* What are a user’s favourite concepts?
* Can you work out a way to recommend an article to the user, that
    * the user hasn’t read
    * most closely matches the user’s interests

## Submission

When you are finished, add your modified files to a public repository, either on Github or Bitbucket

## Notes:

Obviously, concepts which come up most often in a user’s read articles will be concepts the user is most interested in.

Each of an article's concepts could be of equal weight – and code which treats them this way is fine. 

But if you want to get fancy, consider the possibility that the concepts most relevant to an article appear closest to the beginning of the article's concepts array

## Additional Support

Please let us know if you require any support in completing this task, including any reasonable adjustments.
