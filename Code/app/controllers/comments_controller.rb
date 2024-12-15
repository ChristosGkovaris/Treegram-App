class CommentsController < ApplicationController
    def create
      @photo = Photo.find(params[:photo_id])
      @comment = @photo.comments.new(comment_params)
      @comment.user = current_user
  
      if @comment.save
        respond_to do |format|
          format.html do
            flash[:notice] = "Comment added successfully!"
            redirect_to user_path(@photo.user)
          end
          format.json { render json: { success: true, comment: @comment.as_json(include: :user) }, status: :created }
        end
      else
        respond_to do |format|
          format.html do
            flash[:alert] = "Failed to add comment. Please try again."
            redirect_to user_path(@photo.user)
          end
          format.json { render json: { success: false, errors: @comment.errors.full_messages }, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @comment = Comment.find(params[:id])
      @photo = @comment.photo
  
      if current_user == @comment.user || current_user == @photo.user
        @comment.destroy
        respond_to do |format|
          format.html do
            flash[:notice] = "Comment deleted successfully!"
            redirect_to user_path(@photo.user)
          end
          format.json { render json: { success: true }, status: :ok }
        end
      else
        respond_to do |format|
          format.html do
            flash[:alert] = "You are not authorized to delete this comment."
            redirect_to user_path(@photo.user)
          end
          format.json { render json: { success: false, error: "Unauthorized" }, status: :unauthorized }
        end
      end
    end
  
    # Νέα μέθοδος για την επιστροφή των σχολίων μιας φωτογραφίας μέσω JSON
    def comments
      @photo = Photo.find(params[:id])
      @comments = @photo.comments.order(created_at: :desc)
  
      respond_to do |format|
        format.js # Render το comments.js.erb
      end
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:text)
    end
  end