class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @blog = @comment.blog
    respond_to do |format|
      if @comment.save
        format.html { redirect_to blog_path(@blog), notice: 'コメントを投稿しました。' }
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @comment = current_user.comments.build(comment_params)
  end

  def update
    @comment = current_user.comments.build(comment_params)
    @comment.update(comment_params)
    if @blog.save
      redirect_to blog_comment_path, notice: "ブログを更新しました！"
    else
      render 'new'
    end
  end

  def destroy
    @comment = current_user.comments.build(comment_params)
    @comment.destroy
    redirect_to blog_comment_path, notice: "ブログを削除しました！"
  end

  private
    def comment_params
      params.require(:comment).permit(:blog_id, :content)
    end
end