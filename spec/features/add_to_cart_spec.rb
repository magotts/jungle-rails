require 'rails_helper'

RSpec.feature "visit the home page and click 'Add to Cart' buttons for one of the products", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see My Cart (1)" do
    # ACT
    visit root_path
   
    first('article.product').find_button('Add').trigger('click')
    
    # VERIFY
    expect(page).to have_text "My Cart (1)"

    # DEBUG
    # save_screenshot

  end
end
