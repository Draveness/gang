require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_session) { {} }

  describe 'GET #show' do
    it 'returns a success response' do
      user = create :user
      get :show, params: { id: user.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'PUT #update' do
    let(:user) { create :user }
    let(:new_attributes) { { mobile: '18000000000' } }
    let(:invalid_attributes) { { mobile: 'invalid' } }

    context 'with valid params' do
      it 'updates the requested user' do
        put :update, params: { id: user.to_param, user: new_attributes }, session: valid_session
        user.reload
        expect(user.mobile).to eq(new_attributes[:mobile])
      end

      it 'renders a JSON response with the user' do
        put :update, params: { id: user.to_param, user: new_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the user' do
        put :update, params: { id: user.to_param, user: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end
end
