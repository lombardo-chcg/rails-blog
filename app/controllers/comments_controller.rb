class CommentsController < ApplicationController
  http_basic_authenticate_with name: "bob", password: "bob", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)

    respond_to do |format|
        if @comment.save
          format.html { redirect_to @comment.post }
          format.js
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
