require 'spec_helper'

describe MoviesController do
	describe 'find similar movies action' do
		it 'should select the Find Similar Movies template for rendering' do
			@fake_movie = FactoryGirl.create(:movie, :id => '8', :title => 'Movie No. 8', :director => 'John Director')
			get :find_similar_movies, {:id => 8}
			response.should render_template('find_similar_movies')
		end

		it 'should go to home page if no similar movies found' do
			@fake_movie = FactoryGirl.create(:movie, :id => '9', :title => 'Movie No. 9')
			get :find_similar_movies, {:id => 9}
			response.should render_template('movies')
		end
	end
end