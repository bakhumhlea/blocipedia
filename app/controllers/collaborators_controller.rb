class CollaboratorsController < ApplicationController
  
  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.where('email LIKE ?', "%#{params[:search]}%").first
    
    if @user
      unless @wiki.collaborators.pluck(:user_id).include?(@user)
        @collaborator = Collaborator.new(user_id: @user.id, wiki_id: @wiki.id)
      else
        flash[:alert] = "That user is already a collaborator."
        redirect_back(fallback_location: @wiki)
        return
      end
    else
      flash[:alert] = "No user matched."
      redirect_back(fallback_location: @wiki)
      return
    end
    
    if @collaborator.save
      flash[:notice] = "#{@user.username} has been added."
    else
      flash[:alert] = "There was an error adding the collaborator. Please try again."
    end
    
    redirect_back(fallback_location: @wiki)
  end
  
  def destroy
    @collaborator = Collaborator.find(params[:id])
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find(@collaborator.user_id)
    ## I don't understand this line#33 why I can't pass params[:user_id] in User.find method instead of @collaborator.user_id. 
    
    if @collaborator.destroy
      redirect_to edit_wiki_path(@wiki.id), notice: "#{@user.username} has been removed from collaborators TT"
    else
      flash.now[:alert] = "Error occur!, Can't remove collaborator from this wiki :("
      redirect_to edit_wiki_path(@wiki.id)
    end
  end
  
end
