require "rails_helper"

RSpec.describe "admin/products/index", type: :view do
 let(:category) {FactoryGirl.create :category}

  before {sign_in FactoryGirl.create(:admin)}

  let(:category) do
    mock_model(Category,
      name: "asdsa",
      description: "this is test"
      )
  end

  let(:product1) do
    mock_model(Product,
      name: "food",
      description: "this is test",
      price: 22,
      created_at: "2016/12/12",
      category: category
      )
  end

  let(:product2) do
    mock_model(Product,
      name: "food2",
      description: "this is test2",
      price: 22,
      created_at: "2016/12/12",
      category: category
      )
  end


  before do
    @q = Product.search(params[:q])
    assign(:products, Kaminari.paginate_array([product1, product2]).page(1))

    render
  end

  context "UI index product" do
    it "should have text" do
      expect(rendered).to have_text "food"
    end
  end
end
