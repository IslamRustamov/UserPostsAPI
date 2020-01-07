require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe "GET #index" do
    before do
      get :index
    end

    it "returns the list of users" do
      @user = FactoryBot.create_list(:user, 10)
      expect(assigns(:users)).to eq(@user.reverse)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end
  end
  describe "GET #show" do
    before do
      @user = FactoryBot.create(:user)
      get :show, params: { id: @user.id }
    end

    it "returns the users" do
      expect(assigns(:user)).to eq(@user)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      expect(response).to render_template("show")
    end
  end
  describe "POST #create" do
    context "when is successfully created" do
      before do
        @user_attributes = FactoryBot.attributes_for(:user)
        post :create, params: { user: @user_attributes }
      end

      it "returns http success" do
        expect(response).to have_http_status(:created)
      end

      it "renders the index template" do
        expect(response).to render_template("create")
      end
    end
    context "when is unsuccessfully created" do
      before do
        @user_attributes = FactoryBot.attributes_for(:user)
        @user_attributes[:name] = nil
        post :create, params: { user: @user_attributes }
      end

      it "returns http success" do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
