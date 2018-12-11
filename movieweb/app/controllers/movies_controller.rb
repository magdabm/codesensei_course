class MoviesController < ApplicationController

   http_basic_authenticate_with name: "admin", password: "secret", except: [:index, :show]

   before_action :find_movie, only: [:show, :edit, :update, :destroy]

   def index
      @movies = Movie.all.order(:title)
   end

   def show
      @comment = Comment.new
   end

   def new
      @movie = Movie.new
   end

   def edit
   end

   def create
      @movie = Movie.new(movie_params)
      if @movie.save
         redirect_to @movie
      else
         render 'new'
      end
   end

   def update
      if @movie.update(movie_params)
         redirect_to @movie
      else
         render 'edit'
      end
   end

   def destroy
      @movie.destroy
      redirect_to movies_path
   end




   private
   def movie_params
      params.require(:movie).permit(:title, :director, :country, :genre, :description)
   end

   def find_movie
      @movie = Movie.find(params[:id])
   end
end
