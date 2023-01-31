require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Product Validations" do

    before do
     @category = Category.new(:name => "Succulents")
     
    end

    context "given category of 'succulents'" do
      it "returns product category name of 'succulents'" do
        @product = Product.new(:name => "African Moss", :price => 40, :quantity => 2, :category => @category)
        expect(@product.category.name).to eq("Succulents")
      end

    it "returns 'Name cant be blank' when name is set to nil" do
      @product = Product.new(:name => nil, :price => 40, :quantity => 2, :category => @category)
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "returns 'Price is not a number' when price is set to nil" do
      @product = Product.new(:name => "cheap plant", :price_cents => nil, :quantity => 2, :category => @category)
      @product.save
      expect(@product.errors.full_messages).to include("Price is not a number")
    end

    it "returns 'Quantity cant be blank' when Quantity is set to nil" do
      @product = Product.new(:name => "Mellow Yellow", :price => 40, :quantity => nil, :category => @category)
      @product.valid?
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "returns 'Category cant be blank' when Category is set to nil" do
      @product = Product.new(:name => "Subtle duck", :price => 40, :quantity => 2, :category => nil)
      @product.valid?
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

    end


    


  end
end
