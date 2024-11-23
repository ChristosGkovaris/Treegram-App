class CommentsController < ApplicationController
  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment added successfully!"
    else
      flash[:alert] = "Failed to add comment. Please try again."
    end
    redirect_to user_path(@photo.user)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @photo = @comment.photo

    # Ελέγχουμε αν ο χρήστης έχει δικαίωμα διαγραφής
    if current_user == @comment.user || current_user == @photo.user
      @comment.destroy
      flash[:notice] = "Comment deleted successfully!"
    else
      flash[:alert] = "You are not authorized to delete this comment."
    end
    redirect_to user_path(@photo.user)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

