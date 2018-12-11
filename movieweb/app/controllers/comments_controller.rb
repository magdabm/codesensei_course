class CommentsController < ApplicationController

      http_basic_authenticate_with name: "admin", password: "secret", only: :destroy

      before_action :find_movie

   def edit
      @comment = Comment.find(params[:id])
   end


   def create
      @comment = Comment.new(comment_params)
      @comment.movie = @movie
      if @comment.save
         redirect_to movie_path(@movie)
      else
         render 'movies/show'
      end
   end

   def update
      @comment = Comment.find(params[:id])
      @comment.update(comment_params)
      redirect_to movie_path(@movie)
   end

   def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to movie_path(@movie)
   end

   private
   def comment_params
      params.require(:comment).permit(:commenter, :content)
   end

   def find_movie
      @movie = Movie.find(params[:movie_id])
   end

end
