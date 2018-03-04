class CollaboratorsController < ApplicationController
  def destroy
    @collaborator = Collaborator.find(params[:id])
    wiki_id = @collaborator.wiki_id
    col_user = User.find(@collaborator.user_id)
    if @collaborator.destroy
      redirect_to edit_wiki_path(wiki_id), notice: "#{col_user.username} has been removed from collaborators :P"
    else
      flash.now[:alert] = "Error occur!, Can't remove collaborator from this wiki :("
      redirect_to :back
    end
  end
end
