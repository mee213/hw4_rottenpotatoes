require 'spec_helper'

describe Movie do
	describe 'finding similar movies' do
		before :each do
			@fake_movie = FactoryGirl.create(:movie, :id => '8', :title => 'Movie No. 8', :director => 'John Director')
		end
		it 'should find movies with the same director' do
			Movie.should_receive(:find_same_director)
			Movie.find_same_director(@fake_movie.director)
		end
	end
end