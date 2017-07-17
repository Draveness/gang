require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:valid_attributes) { { name: 'Sports' } }
  let(:invalid_attributes) { { name: 'Too Long to Hold' } }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      create :category
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      category = create :category
      get :show, params: { id: category.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Category' do
        expect do
          post :create, params: { category: valid_attributes }, session: valid_session
        end.to change(Category, :count).by(1)
      end

      it 'renders a JSON response with the new category' do
        post :create, params: { category: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(category_url(Category.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new category' do
        post :create, params: { category: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    let(:category) { create :category }
    context 'with valid params' do
      let(:new_attributes) { { name: 'Politics' } }

      it 'updates the requested category' do
        put :update, params: { id: category.to_param, category: new_attributes }, session: valid_session
        category.reload
        skip('Add assertions for updated state')
      end

      it 'renders a JSON response with the category' do
        put :update, params: { id: category.to_param, category: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the category' do
        put :update, params: { id: category.to_param, category: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested category' do
      category = create :category
      expect do
        delete :destroy, params: { id: category.to_param }, session: valid_session
      end.to change(Category, :count).by(-1)
    end
  end
end
