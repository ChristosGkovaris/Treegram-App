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
    @user = User.find(params[:user_id])
    if params[:photo].nil?
      flash[:alert] = "Please upload a photo"
      redirect_to :back
    else
      @photo = Photo.create(photo_params)
      @photo.user_id = @user.id
      @photo.save
      flash[:notice] = "Successfully uploaded a photo"
      redirect_to user_path(@user)
    end
  end

  def new
    @user = User.find(params[:user_id])
    @photo = Photo.new
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :title)
  end
end
