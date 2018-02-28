require 'rails_helper'

RSpec.describe WikisController, type: :controller do
  
  let(:my_user) { create(:user) }
  let(:my_wiki) { create(:wiki, user: my_user) }

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end
    it "instantiates @wiki" do
      get :new
      expect(assigns(:wiki)).not_to be_nil
    end
  end
  
  describe "GET show" do
     it "returns http success" do
       get :show, {id: my_wiki.id}
       expect(response).to have_http_status(:success)
     end
     it "renders the #show view" do
       get :show, {id: my_wiki.id}
       expect(response).to render_template :show
     end
     it "assigns wiki to @wiki" do
       get :show, {id: wiki.id}
       expect(assigns(:wiki)).to eq(my_wiki)
    end
  end
  
  describe "POST create" do
    
    it "increases the number of Wiki by 1" do
      expect{post :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Wiki,:count).by(1)
    end
    
    it "assigns the new wiki to @wiki" do
      post :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(assigns(:wiki)).to eq Wiki.last
    end
    
    it "redirects to the new wiki" do
      post :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(response).to redirect_to Wiki.last
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
    it "renders the #edit view" do
      get :edit, {id: my_wiki.id}
      expect(response).to render_template :edit
    end
    it "assigns post to be updated to @wiki" do
       get :edit, {id: my_wiki.id}
       
       wiki_instance = assigns(:wiki)
       
       expect(wiki_instance.id).to eq my_wiki.id
       expect(wiki_instance.title).to eq my_wiki.title
       expect(wiki_instance.body).to eq my_wiki.body
    end
  end

  describe "GET #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #delete" do
    it "returns http success" do
      get :delete
      expect(response).to have_http_status(:success)
    end
  end

end
