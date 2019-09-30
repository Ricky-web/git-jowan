require 'rails_helper'

describe PostsController do
    describe 'GET #new' do
        it "renders the :new template" do
            get :new
            expect(response).to render_template :new
        end
    end
    
    describe 'GET #edit' do
        it "assigns the requested contact to @post" do
            post = create(:post)
            get :edit, params: { id: post }
            
            # post -> :post
            expect(assigns(:post)).to eq post
        end
        
        it "renders the :edit template" do
            # User side
            post = create(:post)
            get :edit, params: { id: post }
            
            # Our side
            expect(response).to render_template :edit
        end
    end
    
    describe 'GET #index' do
        it "populates an array of posts ordered by created_at DESC" do
            posts = create_list(:post, 3)
            get :index
            
            # Our side
            expect(assigns(:posts)).to match(posts)
        end
        
        it "renders the :index template" do
            posts = crate_list(:post, 3)
            get :index
            
            # Our side
            expect(response).to render_template(:index)
        end
    end
end