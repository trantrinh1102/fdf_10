require "rails_helper"

RSpec.describe Product, type: :model do
  let(:catrgory) {FactoryGirl.create :catrgory}
  let(:product) {FactoryGirl.create :product}

  describe "validations" do
    it {is_expected.to validate_presence_of :name}
  end

  describe "Associations" do
    it {is_expected.to have_many :order_items}
    it {is_expected.to have_many :comments}
    it {is_expected.to belong_to :category}
  end

end
