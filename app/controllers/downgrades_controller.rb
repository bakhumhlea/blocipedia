class DowngradesController < ApplicationController
  def update
      @user = current_user
      current_user.role = "standard"
      wikis_private = Wiki.where(private: true, user: current_user)
      
      if @user.save
          wikis_private.update_all(private: false)
          flash[:notice] = "Your premium package has been canceled, All of your private wikis become public."
          redirect_to edit_user_registration_path
      else
          flash.now[:alert] = "Can not downgradw your account. Please try again."
          redirect_to edit_user_registration_path
      end
  end
end
