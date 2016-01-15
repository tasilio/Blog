class CommentsController < ApplicationController
before_filter :authenticate_user!, :only => [:create]	
	def create
		@article = Article.find(params[:article_id])
		
		@article.comments.create(:body => comment_params[:body], :author => current_user.username)
		redirect_to article_path(@article)
	end

private   
# разрешение передачи данных со страницы браузера на сервер

	def comment_params
		params.require(:comment).permit(:body)
	end		


end
