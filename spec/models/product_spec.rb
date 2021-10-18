require 'rails_helper'

RSpec.describe Product, type: :model do
    
# Have one example for each validation, and for each of these:
# Set all fields to a value but the validation field being tested to nil
# Test that the expect error is found within the .errors.full_messages array
# You should therefore have five examples defined given that you have the four validations above

  describe 'Validations' do
    # validation tests/examples here

    it 'should have all four fields set save successfully' do
      @category = Category.create(name: "gadgets")
      @product = Product.create(name: "macbook pro", price_cents: 250000, quantity: 100, category: @category)

      expect(@product.valid?).to be true
    end

    it 'should have a valid name' do
      @category = Category.create(name: "gadgets")
      @product = Product.create(name: nil, price_cents: 250000, quantity: 100, category: @category)

      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should have a price' do
      @category = Category.create(name: "gadgets")
      @product = Product.create(name: "macbook pro", price_cents: nil, quantity: 100, category: @category)      

      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should have a quantity' do
      @category = Category.create(name: "gadgets")
      @product = Product.create(name: "macbook pro", price_cents: 250000, quantity: nil, category: @category) 

      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should have a category' do
      @product = Product.create(name: "macbook pro", price_cents: 250000, quantity: 100, category: nil)

      expect(@product.errors.full_messages).to include("Category can't be blank")

    end

  end
end
