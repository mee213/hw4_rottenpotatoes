Given /^the following movies exist:$/ do |movies_table|
	movies_table.hashes.each do |movie|
		Movie.create!(movie)
	end
end

When /^I go to the edit page for "([^"]*)"$/ do |movie|
	movie_obj = Movie.find_by_title(movie)
	movie_id = movie_obj.id
	visit path_to("the edit page for #{movie_id}")
end