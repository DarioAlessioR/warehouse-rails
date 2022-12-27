require 'rails_helper'

RSpec.describe 'Product show page', type: :feature do
  before(:each) do
    @product = Product.create(name: 'Product 1', reference: 'P1')
    @movement = Movement.create(product: @product, movement_type: Movement::MovementTypes[:add], movement_quantity: 10, comment: 'Initial stock')
  end

  it 'displays the product name' do
    visit product_path(@product)
    expect(page).to have_content('Product 1')
  end

  it 'displays the product reference' do
    visit product_path(@product)
    expect(page).to have_content('P1')
  end

  it 'displays the product quantity' do
    visit product_path(@product)
    expect(page).to have_content('10')
  end

  it 'displays the product Edit link' do
    visit product_path(@product)
    expect(page).to have_link('Edit', href: edit_product_path(@product))
  end

  it 'displays the product Back link' do
    visit product_path(@product)
    expect(page).to have_link('Back', href: products_path)
  end

  it 'displays the product Name column' do
    visit product_path(@product)
    expect(page).to have_content('Product name')
  end

  it 'displays the product Reference column' do
    visit product_path(@product)
    expect(page).to have_content('Product reference')
  end

  it 'displays the product Quantity column' do
    visit product_path(@product)
    expect(page).to have_content('Product quantity')
  end

  it 'displays the product Comment column' do
    visit product_path(@product)
    expect(page).to have_content('Comment')
  end

  it 'displays the product Movement type column' do
    visit product_path(@product)
    expect(page).to have_content('Type')
  end

  it 'displays the product Movement quantity column' do
    visit product_path(@product)
    expect(page).to have_content('Quantity')
  end

  it 'displays the product Date/Time at column' do
    visit product_path(@product)
    expect(page).to have_content('Date/Time')
  end

  it 'displays the product Comment at column' do
    visit product_path(@product)
    expect(page).to have_content('Comment')
  end
end
