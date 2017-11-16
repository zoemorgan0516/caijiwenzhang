class LabelsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @labels = Label.all
  end

  def show
    @label = Label.find(params[:id])
  end

  def new
    @label = Label.new
  end

  def create
    @label = Label.new(article_params)
    if @label.save
      redirect_to labels_path
    else
      render :new
    end
  end

  def edit
    @label = Label.find(params[:id])
  end

  def update
    @label = Label.find(params[:id])
    if @label.update(article_params)
      redirect_to labels_path
    else
      render :edit
    end
  end

  def destroy
    @label = Label.find(params[:id])
    @label.destroy
    redirect_to labels_path
  end

  def live
    @label = Label.find(params[:id])
    @label.update(active: true)
    redirect_to labels_path

  end

  def unlive
    @label = Label.find(params[:id])
     @label.update(active: false)
     redirect_to labels_path

  end



  private

  def article_params
    params.require(:label).permit(:name, :used_count, :active)
  end

end
