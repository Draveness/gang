require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  let(:valid_attributes) { { name: 'Tag' } }
  let(:invalid_attributes) { { name: 'A too long tag' } }
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      create :tag
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    let(:tag) { create :tag }
    it 'returns a success response' do
      get :show, params: { id: tag.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Tag' do
        expect do
          post :create, params: { tag: valid_attributes }, session: valid_session
        end.to change(Tag, :count).by(1)
      end

      it 'renders a JSON response with the new tag' do
        post :create, params: { tag: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(tag_url(Tag.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new tag' do
        post :create, params: { tag: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    let(:tag) { create :tag }

    context 'with valid params' do
      let(:new_attributes) { { name: 'New Tag' } }

      it 'updates the requested tag' do
        put :update, params: { id: tag.to_param, tag: new_attributes }, session: valid_session
        tag.reload
        expect(tag.name).to eq(new_attributes[:name])
      end

      it 'renders a JSON response with the tag' do
        put :update, params: { id: tag.to_param, tag: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the tag' do
        put :update, params: { id: tag.to_param, tag: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  # describe 'DELETE #destroy' do
  #   it 'destroys the requested tag' do
  #     tag = create :tag
  #     expect do
  #       delete :destroy, params: { id: tag.to_param }, session: valid_session
  #     end.to change(Tag, :count).by(-1)
  #   end
  # end
end
