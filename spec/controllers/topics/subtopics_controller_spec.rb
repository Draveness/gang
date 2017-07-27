require 'rails_helper'

RSpec.describe Topics::SubtopicsController, type: :controller do
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) { { name: '' } }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      create :subtopic
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      subtopic = Topics::Subtopic.create! valid_attributes
      get :show, params: { id: subtopic.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Topics::Subtopic' do
        expect do
          post :create, params: { topics_subtopic: valid_attributes }, session: valid_session
        end.to change(Topics::Subtopic, :count).by(1)
      end

      it 'renders a JSON response with the new topics_subtopic' do
        post :create, params: { topics_subtopic: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(topics_subtopic_url(Topics::Subtopic.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new topics_subtopic' do
        post :create, params: { topics_subtopic: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested topics_subtopic' do
        subtopic = Topics::Subtopic.create! valid_attributes
        put :update, params: { id: subtopic.to_param, topics_subtopic: new_attributes }, session: valid_session
        subtopic.reload
        skip('Add assertions for updated state')
      end

      it 'renders a JSON response with the topics_subtopic' do
        subtopic = Topics::Subtopic.create! valid_attributes

        put :update, params: { id: subtopic.to_param, topics_subtopic: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the topics_subtopic' do
        subtopic = Topics::Subtopic.create! valid_attributes

        put :update, params: { id: subtopic.to_param, topics_subtopic: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested topics_subtopic' do
      subtopic = Topics::Subtopic.create! valid_attributes
      expect do
        delete :destroy, params: { id: subtopic.to_param }, session: valid_session
      end.to change(Topics::Subtopic, :count).by(-1)
    end
  end
end
