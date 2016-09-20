require "rails_helper"

describe "product_suggests/show.html.erb" do
  it "displays product_suggest details correctly" do
    assign(:product_suggest, ProductSuggest.new)

    stub_template "product_suggests/_form.html.erb"
  end

  it "infers the controller path" do
    expect(controller.request.path_parameters[:controller]).to eq("product_suggests")
    expect(controller.controller_path).to eq("product_suggests")
  end
end
