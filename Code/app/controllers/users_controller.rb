class UsersController < ApplicationController
    def create
      @user = User.new(user_params)
      @user.valid?
      if !@user.is_email?
        flash[:alert] = "Input a properly formatted email."
        redirect_to :back
      elsif @user.errors.messages[:email] != nil
        flash[:notice] = "That email " + @user.errors.messages[:email].first
        redirect_to :back
      elsif @user.save
        flash[:notice] = "Signup successful. Welcome to the site!"
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:alert] = "There was a problem creating your account. Please try again."
        redirect_to :back
      end
    end
  
    def new
    end
  
    def show
      @user = User.find(params[:id])
      @all_users = User.all # Ανάθεσε όλους τους χρήστες στη μεταβλητή @all_users
  
  
      # Φωτογραφίες του χρήστη που εμφανίζεται
      @photos = @user.photos.order(created_at: :desc)
  
      # Φωτογραφίες των ακολουθούμενων χρηστών (μόνο για τον current_user)
      if current_user == @user
        @followed_photos = current_user.followed_users.includes(:photos).flat_map(&:photos).sort_by(&:created_at).reverse
        # Για σχόλια
        @comment = Comment.new
      else
        @followed_photos = []
        # Για σχόλια
        @comment = Comment.new
      end
  
   end
  
  
    def follow
      user_to_follow = User.find(params[:id])
      if current_user.followed_users.include?(user_to_follow)
        flash[:alert] = "You are already following this user."
      else
        current_user.followed_users << user_to_follow
        flash[:notice] = "You are now following #{user_to_follow.email}!"
      end
      redirect_to user_path(current_user)
    end
  
    def unfollow
      user_to_unfollow = User.find(params[:id])
      if current_user.followed_users.include?(user_to_unfollow)
        current_user.followed_users.delete(user_to_unfollow)
        flash[:notice] = "You unfollowed #{user_to_unfollow.email}."
      else
        flash[:alert] = "You are not following this user."
      end
      redirect_to user_path(current_user)
    end
  
    private
  
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :avatar)
    end
  end