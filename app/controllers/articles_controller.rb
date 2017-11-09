
class ArticlesController < ApplicationController

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

  def new
  	@article = Article.new
		@labels = Label.all.map{|label| [label.name, label.id.to_s]}
  end

  def create
  	@article = Article.new(article_params)
		selected_labels = Label.in(id: params["check_labels"].try(:values))
		@article.labels << selected_labels
  	if @article.save
  		redirect_to articles_path
  	else
  		render :new
  	end

  end

  def edit
  	@article = Article.find(params[:id])
		@labels = Label.all.map{|label| [label.name, label.id.to_s]}
  end

  def update
  	@article = Article.find(params[:id])

  	if @article.update(article_params)
  		redirect_to articles_path
  	else
  		render :edit
  	end
  end

	  def destroy
	    @article = Article.find(params[:id])
	    @article.destroy
	    flash[:alert] = "Article deleted"
	    redirect_to articles_path
	  end



 	private

 	def article_params
 		params.require(:article).permit(:title, :content, :gonghao_name, :traffic)
 	end


end
