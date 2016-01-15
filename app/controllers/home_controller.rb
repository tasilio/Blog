class HomeController < ApplicationController
  def index
  	@articles = Article.all
  	render 'articles/index'
  end
end
