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
    @blog = @comment.blog
  end

  def update
    @comment = current_user.comments.build(comment_params)
    @blog = @comment.blog
    respond_to do |format|
      if @comment.save
        format.html { redirect_to blog_path(@blog), notice: 'コメントを更新しました。' }
        format.js { render :index }
      else
        format.html { render :new }
      end
  end

  def destroy
    @comment = current_user.comments.build(comment_params)
    @blog = @comment.blog
    respond_to do |format|
      if @comment.destroy
        format.html { redirect_to blog_path(@blog), notice: 'コメントを削除しました。' }
        format.js { render :index }
      else
        format.html { render :new }
      end
  end

  private
    def comment_params
      params.require(:comment).permit(:blog_id, :content)
    end
end