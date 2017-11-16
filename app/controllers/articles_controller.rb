
class ArticlesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
		@label = @article.labels
    @pictures = @article.pictures
    @picture = @article.pictures.new
	end

  def new
  	@article = Article.new
		@labels = Label.all.map{|label| [label.name, label.id.to_s]}
    @pictures = Picture.all.map{|picture| [picture.avatar, picture.id.to_s]}
  end

  def create
  	@article = Article.new(article_params)
		selected_labels = Label.in(id: params["checked_labels"]&.values)
    @article.labels << selected_labels

    selected_pictures = Picture.in(id: params["checked_pictures"]&.values)
    @article.pictures << selected_pictures


		puts "=" * 20
		puts selected_labels
		puts "-" * 20

  	if @article.save
      # files = params[:file].values
      # files.each do |file|
      #   Picture.create(article: @article, file: file)
      # end

  		redirect_to article_path(@article)
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
 		params.require(:article).permit(:title, :content, :gonghao_name, :traffic )
 	end


end
