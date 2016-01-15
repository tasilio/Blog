class CommentsController < ApplicationController

	def create
		@article = Article.find(params[:article_id])
		@article.comments.create(comment_params)
		redirect_to article_path(@article)
	end

private   
# разрешение передачи данных со страницы браузера на сервер

	def comment_params
		params.require(:comment).permit(:author, :body)
	end		


end
