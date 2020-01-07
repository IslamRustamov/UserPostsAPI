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
end
