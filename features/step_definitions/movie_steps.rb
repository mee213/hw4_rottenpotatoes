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

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
	fill_in(field, :with => value)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
	click_button(button)
end

Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |title, this_director|
	movie = Movie.find_by_title(title)
	this_director.should == movie.director
end

Given /^(?:|I )am on the details page for "([^"]*)"$/ do |movie|
	movie_obj = Movie.find_by_title(movie)
	movie_id = movie_obj.id
	visit path_to("the details page for #{movie_id}")
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end

Then /^I should be on the Similar Movies page for "([^"]*)"$/ do |movie_title|
	movie_id = Movie.find_by_title(movie_title).id
	current_path = URI.parse(current_url).path
	current_path.should == path_to("the Similar Movies page for #{movie_id}")
end