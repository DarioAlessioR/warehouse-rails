require 'rails_helper'

RSpec.describe 'Product index page', type: :feature do
  before(:each) do
    @product = Product.create(name: 'Product 1', reference: 'P1')
    @movement = Movement.create(product: @product, movement_type: Movement::MovementTypes[:add], movement_quantity: 10, comment: 'Initial stock')
  end

  it 'displays the product name' do
    visit products_path
    expect(page).to have_content('Product 1')
  end

  it 'displays the product reference' do
    visit products_path
    expect(page).to have_content('P1')
  end

  it 'displays the product quantity' do
    visit products_path
    expect(page).to have_content('10')
  end

  it 'displays the product Details link' do
    visit products_path
    expect(page).to have_link('Details', href: product_path(@product))
  end

  it 'displays the product Export to Excel link' do
    visit products_path
    expect(page).to have_content('Export to Excel')
  end

  it 'displays the product Create product link' do
    visit products_path
    expect(page).to have_link('Create new product', href: new_product_path)
  end

  it 'displays the product Quantity column' do
    visit products_path
    expect(page).to have_content('Quantity')
  end
end