require 'rails_helper'

RSpec.describe ProductSuggest, type: :model do
  describe "Associations" do
    it {is_expected.to belong_to :user}
    it {is_expected.to belong_to :category}
  end

  describe "Validations" do
    it {is_expected.to validate_presence_of :product_name}
    it {is_expected.to validates_processing_of :image}
  end
end
