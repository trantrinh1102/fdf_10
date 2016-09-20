require "rails_helper"
require "spec_helper"
RSpec.describe "product_suggests/show", type: :view do

  describe "product_suggests/show.html.erb" do
    before do
      @product_suggest = FactoryGirl.create(:product_suggest)
      render
    end

    describe "UI product suggests show" do
      context "product_name product suggest" do
        it {expect(rendered).to have_text @product_suggest.product_name}
      end

      context "description product suggest" do
        it {expect(rendered).to have_text @product_suggest.description}
      end

      context "should have button back" do
        it {expect(rendered).to have_text "Back"}
      end
    end
  end
end
