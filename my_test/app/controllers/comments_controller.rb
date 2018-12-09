class CommentsController < ApplicationController

   def show
   end

   def create
      @article = Article.find(params[:article_id])
      @comment = @article.comments.create(comment_params)
      if @comment.save
         redirect_to article_path(@article)
      else
         render 'articles/show'
      end
   end

   def destroy
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      @comment.destroy
      redirect_to articles_path(@article)
   end

   private
   def comment_params
      params.require(:comment).permit(:commenter, :body)
   end

end
