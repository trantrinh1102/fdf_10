require "rails_helper"

RSpec.describe ProductSuggestsController, type: :controller do
  before {sign_in FactoryGirl.create(:user)}

  describe "Load load_categories" do
    it "load load_categories" do
      should use_before_action(:load_categories)
    end
  end

  describe "GET #index" do
    before do
      get :index
    end

    it "renders the index template" do
      expect(response).to render_template(:index)
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    it "responds successfully" do
      post :create, {product_suggest: {product_name: "ABC", category_id: 1, description: "dsds"}}
      expect(flash[:success]).not_to be_empty
    end

    it "responds error" do
      post :create, {product_suggest: { category_id: 1, description: "dsds"}}
      expect(response).to render_template(:new)
    end
  end

  describe "DELETE #destroy" do
    let(:product_suggest){FactoryGirl.create(:product_suggest)}
    it "responds successfully" do
      xhr :delete,:destroy, {id: product_suggest.id}
      expect(flash[:success]).not_to be_empty
    end
  end

  describe "GET#new" do
    before do
      get :new
    end

    it "renders the index template" do
      expect(response).to render_template(:new)
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end
