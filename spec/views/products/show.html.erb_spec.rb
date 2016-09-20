require "rails_helper"

RSpec.describe "products/show", type: :view do

  describe "products/show.html.erb" do
    before do
      @product =  FactoryGirl.create :product
      render
    end
    describe "UI product show page" do

      context "should have name product" do
        it{expect(rendered).to have_text @product.name}
      end

      context "should have price product" do
        it{expect(rendered).to have_text @product.price}
      end

      context "should have category" do
        it{expect(rendered).to have_text @product.category.try :name}
      end

    end
  end
end
