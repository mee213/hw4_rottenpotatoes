require 'spec_helper'

describe 'find similar movies route' do
	it 'routes a named RESTful route called find_similar_movies' do
		@fake_movie = FactoryGirl.build(:movie, :id => '7', :title => 'The Gods Must Be Crazy', :director => 'Who Knows')
		assert_routing('movies/7/find_similar_movies', {:controller => 'movies', :action => 'find_similar_movies', :id => '7'})
	end
end
