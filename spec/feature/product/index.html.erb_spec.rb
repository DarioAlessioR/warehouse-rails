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

  it 'displays the product movements link' do
    visit products_path
    expect(page).to have_link('Movements', href: product_path(@product))
  end

  it 'displays the product new movement link' do
    visit products_path
    expect(page).to have_link('New movement', href: new_movement_product_path(@product))
  end

  it 'displays the product edit link' do
    visit products_path
    expect(page).to have_link('Edit', href: edit_product_path(@product))
  end

  it 'displays the product delete link' do
    visit products_path
    expect(page).to have_link('Delete', href: product_path(@product))
  end
end