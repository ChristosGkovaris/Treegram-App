class PhotosController < ApplicationController

  def destroy
    @photo = Photo.find(params[:id])

    if current_user == @photo.user
      @photo.destroy
      flash[:notice] = "Photo and all related comments and tags were successfully deleted!"
    else
      flash[:alert] = "You are not authorized to delete this photo."
    end
    redirect_to user_path(current_user)
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def create
    if params[:photo].nil?
      flash[:alert] = "Please upload a photo"
      redirect_to :back
    else
      @photo = current_user.photos.new(photo_params)
      if @photo.save
        flash[:notice] = "Successfully uploaded a photo"
      else
        flash[:alert] = "Failed to upload photo. Please try again."
      end
      redirect_to user_path(current_user)
    end
  end

  def new
    @photo = Photo.new
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :title)
  end
end