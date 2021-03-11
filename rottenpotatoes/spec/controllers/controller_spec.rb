require 'rails_helper'


RSpec.describe "Routing test", :type => :request do
    it "route correctly when the movie has a director" do
        new_movies = [{"title": "movie_1", "director": "director_a"}, {"title": "movie_2"}, {"title": "movie_3", "director": "director_a"}]
        new_movies.each do |new_movie|
            Movie.create(new_movie)
        end
        
        id =  Movie.where(title: "movie_1")[0].as_json["id"]
        get "/movies/#{id}/same_director"
        expect(response).to render_template("same_director")
    end

    it "route correctly when the movie has no director" do
        new_movies = [{"title": "movie_1", "director": "director_a"}, {"title": "movie_2"}, {"title": "movie_3", "director": "director_a"}]
        new_movies.each do |new_movie|
            Movie.create(new_movie)
        end
        
        id =  Movie.where(title: "movie_2")[0].as_json["id"]
        get "/movies/#{id}/same_director"
        expect(response).to redirect_to("/movies")
    end
    
end