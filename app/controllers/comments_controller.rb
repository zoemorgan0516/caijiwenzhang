class CommentsController < ApplicationController


  # POST /comments
  # POST /comments.json
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    if @comment.save
      redirect_to article_path(@article), notice: 'Comment was successfully created.'
    else
      render :new

    end
  end


private

# Never trust parameters from the scary internet, only allow the white list through.
def comment_params
  params.require(:comment).permit(:speaker_name, :text)
end
end
