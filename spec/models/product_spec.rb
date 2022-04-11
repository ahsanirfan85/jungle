require 'rails_helper'
require 'product'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    context "All fields present" do
      it "Saves successfully" do
        @category = Category.new
        @category.name = "Shoes"
        @product = Product.new
        @product.name = "Aldo"
        @product.price = 94.99
        @product.quantity= 25
        @product.category = @category
        @product.save
        expect(@product.errors.full_messages).to match_array([])
      end
    end

    context "Missing name" do
      it "Gives an error" do
        @category = Category.new
        @category.name = "Books"
        @product = Product.new
        @product.name = nil
        @product.price = 14.99
        @product.quantity = 100
        @product.category = @category
        @product.save
        expect(@product.errors.full_messages).to include "Name can't be blank"
      end
    end

    context "Missing price" do
      it "Gives an error" do
        @category = Category.new
        @category.name = "Music"
        @product = Product.new
        @product.name = "Metallica"
        @product.price = nil
        @product.quantity= 33
        @product.category = @category
        @product.save
        expect(@product.errors.full_messages).to include "Price can't be blank"
      end
    end

    context "Missing quantity" do
      it "Gives an error" do
        @category = Category.new
        @category.name = "Movies"
        @product = Product.new
        @product.name = "The Batman"
        @product.price = 24.99
        @product.quantity= nil
        @product.category = @category
        @product.save
        expect(@product.errors.full_messages).to include "Quantity can't be blank"
      end
    end

    context "Missing category" do
      it "Gives an error" do
        @category = Category.new
        @category.name = "Food"
        @product = Product.new
        @product.name = "Frito Lays"
        @product.price = 4.99
        @product.quantity= 75
        @product.category = nil
        @product.save
        expect(@product.errors.full_messages).to include "Category can't be blank"
      end
    end

  end
end