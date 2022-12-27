require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  before(:each) do
    @product = Product.create(name: 'Product 1', reference: 'P1')
    @movement = Movement.create(product: @product, movement_type: Movement::MovementTypes[:add], movement_quantity: 10, comment: 'Initial stock')
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: @product.to_param }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get :edit, params: { id: @product.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Product' do
        expect {
          post :create, params: { product: { name: 'Product 2', reference: 'P2' } }
        }.to change(Product, :count).by(1)
      end

      it 'redirects to the created product' do
        post :create, params: { product: { name: 'Product 2', reference: 'P2' } }
        expect(response).to redirect_to(Product.last)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the "new" template)' do
        post :create, params: { product: { name: '', reference: '' } }
        expect(response).not_to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        { name: 'Product 2', reference: 'P2' }
      }

      it 'updates the requested product' do
        put :update, params: { id: @product.to_param, product: new_attributes }
        @product.reload
        expect(@product.name).to eq('Product 2')
        expect(@product.reference).to eq('P2')
      end

      it 'redirects to the product' do
        put :update, params: { id: @product.to_param, product: new_attributes }
        expect(response).to redirect_to(@product)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested product' do
      expect {
        delete :destroy, params: { id: @product.to_param }
      }.to change(Product, :count).by(-1)
    end

    it 'redirects to the products list' do
      delete :destroy, params: { id: @product.to_param }
      expect(response).to redirect_to(products_url)
    end
  end

  describe 'GET #new_movement' do
    it 'returns a success response' do
      get :new_movement, params: { id: @product.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create_movement' do
    context 'with valid params' do
      it 'creates a new Movement' do
        expect {
          post :create_movement, params: { id: @product.to_param, movement: { movement_type: Movement::MovementTypes[:remove], movement_quantity: 5, comment: 'Test' } }
        }.to change(Movement, :count).by(1)
      end

      it 'redirects to the product' do
        post :create_movement, params: { id: @product.to_param, movement: { movement_type: Movement::MovementTypes[:remove], movement_quantity: 5, comment: 'Test' } }
        expect(response).to redirect_to(@product)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the "new" template)' do
        post :create_movement, params: { id: @product.to_param, movement: { movement_type: '', movement_quantity: '', comment: '' } }
        expect(response).not_to be_successful
      end
    end
  end
end
