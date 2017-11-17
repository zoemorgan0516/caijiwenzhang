
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
  end

  def new
    @article = Article.new
    @labels = Label.all.map{|label| [label.name, label.id.to_s]}
    @picture = @article.pictures.new
  end

  def create
    @article = Article.new(article_params)
    selected_labels = Label.in(id: params["checked_labels"]&.values)
    puts "=" * 20
    puts selected_labels
    puts "-" * 20
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

  def traffic_up
    @article = Article.find(params[:id])
    @article.traffic_add
    redirect_to article_path(@article)
  end

  def ascending
    @articles = Article.all
    @articles = @articles.order_by(:traffic.asc)
    render :index
  end

  def descending
    @articles = Article.all
    @articles = @articles.order_by(:traffic.desc)
    render :index
  end

  def time_order
    @articles = Article.all
    @articles = @articles.order_by(:created_at => 'desc')
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :gonghao_name, :traffic )
  end


end
