class WikisController < ApplicationController
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_action :authenticate_user!
  
  def index
    @wikis = policy_scope(Wiki)
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
    authorize @wiki
    
    if @wiki.save
      redirect_to @wiki, notice: "Congret! Your Wiki has been created :D"
    else
      message = @wiki.valid? ? "Error occur! Please try again." : "Invalid Input!"
      flash.now[:alert] = message
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
      message = @wiki.valid? ? "Error occur! Please try again." : "Invalid Input!"
      flash.now[:alert] = message
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    
    if @wiki.destroy
      redirect_to wikis_path, notice: "Wiki Id:#{@wiki.id} has been deleted :P"
    else
      flash.now[:alert] = "Error occur!, Can't delete your wiki :("
      redirect_to @wiki
    end
  end
  
  private
  
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
  
  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    
    flash[:alert] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
    redirect_to(request.referrer || wikis_path)
  end
  
end
