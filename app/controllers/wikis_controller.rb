class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end
  
  def show
    @wiki = Wiki.find(params[:id])
  end
  
  def new
    @wiki = Wiki.new
  end
  
  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user
    
    if @wiki.save
      redirect_to @wiki, notice: "Congret! Your Wiki has been created :D"
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)
    
    if @wiki.save
      redirect_to @wiki, notice: "Your contents has been updated :D"
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :update
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    
    if @wiki.destroy
      redirect_to wikis_path, notice: "The wiki has been deleted :P"
    else
      flash.now[:alert] = "Error occur!, Can't delete your wiki :("
    end
  end
  
  private
  
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end
