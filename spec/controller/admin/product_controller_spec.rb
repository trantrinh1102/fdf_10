require "rails_helper"

RSpec.describe Admin::ProductsController, type: :controller do

  before {sign_in FactoryGirl.create(:admin)}

  let :attributes_true do
    FactoryGirl.attributes_for :product, name: "name update", price: 20,
      description: "description", image: "slide2.jpg", category_id: 1
  end

  let :attributes_false do
    FactoryGirl.attributes_for :product, name: "name pdate", price: 20,
      description: "description", image: "slide2.jpg", category_id: nil
  end

  describe "Load load_categories" do
    it "load load_categories" do
      should use_before_action(:load_categories)
    end
  end

  describe "GET #index" do

    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  context "GET #new" do
    let(:product) {Product.new}
    it "new product" do
      xhr :get, :new
      expect(product).to be_a_new Product
    end
  end

  context "POST #create" do
    it "create success" do
      post :create, product: attributes_true
      expect(assigns(:product)).to be_a Product
    end

    it "create failed" do
      post :create, product: attributes_false
      expect(assigns(:product)).to be_a_new Product
    end
  end

  context "DELETE #destroy" do
    let!(:product){FactoryGirl.create(:product)}
    it "responds successfully" do
      expect do
      xhr :delete,:destroy, {id: product.id}
      end.to change{Product.count}.by(-1)
    end

    it "delete failed" do
      product.destroy
      xhr :delete, :destroy, id: product.id
      expect(flash[:danger]).not_to be_empty
    end
  end

  describe "PATCH #update" do
    let!(:product) {FactoryGirl.create :product}

    it "update success" do
      put :update, {id: product.id, product: attributes_true}
      product.reload
      expect(flash[:success]).not_to be_empty
    end

    it "update failed" do
      put :update, {id: product.id, product: attributes_false}
      product.reload
      expect(response).to render_template("edit")
    end
  end
end
