require 'rails_helper'

RSpec.feature "Visitor navigates to product details page after visiting the home page", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Visitor is able to view product details page" do
    visit root_path
    click_link('Details')

    sleep 1
    save_screenshot

    expect(page).to have_css 'article.product-detail'

  end
end