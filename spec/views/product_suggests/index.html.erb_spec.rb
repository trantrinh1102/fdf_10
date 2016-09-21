require "rails_helper"

RSpec.describe "product_suggests/index", type: :view do

  let(:user) {FactoryGirl.create :user}

  let(:category) do
    mock_model Category, name: "category", created_at: "12/12/2016"
  end

  let(:product_suggest) do
    mock_model ProductSuggest, product_name: "First", category: category,
      user_id: 1, created_at: "12/12/2016"
  end

  let(:product_suggest2) do
    mock_model ProductSuggest, product_name: "Second", category: category,
      user_id: 1, created_at: "12/12/2016"
  end

  before do
    sign_in user
    assign :product_suggests, Kaminari.paginate_array([product_suggest, product_suggest2]).page(1)
    render
  end

  it "displays product_suggest correctly" do
    expect(rendered).to have_text product_suggest.product_name
    expect(rendered).to have_text product_suggest2.product_name
  end
end
