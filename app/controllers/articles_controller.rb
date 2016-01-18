class ArticlesController < ApplicationController
	before_filter :authenticate_user!, except: [:index]	
	

	def index

		@articles = Article.all
		@user = current_user
		
	end


	def show

		@article = Article.find(params[:id])

	end

	def new
		
	end
	
	def create
		@article = Article.new (article_params)
		@article[:username] = current_user.username
		if @article.save
			redirect_to @article
		else
			render action: 'new'
		end	
	end

	def edit

		@article = Article.find(params[:id])

	end

	def update

		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render action: 'edit'
		end	
	end

	def destroy
		article = Article.find(params[:id])
		@ident = params[:id]
		article.destroy
		# render action: 'index'
	end

private   
# разрешение передачи данных со страницы браузера на сервер

	def article_params
		params.require(:article).permit(:title, :text)
	end		

end
