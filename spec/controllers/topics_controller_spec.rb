require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      topic = Topic.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      topic = Topic.create! valid_attributes
      get :show, params: { id: topic.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Topic' do
        expect do
          post :create, params: { topic: valid_attributes }, session: valid_session
        end.to change(Topic, :count).by(1)
      end

      it 'renders a JSON response with the new topic' do
        post :create, params: { topic: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(topic_url(Topic.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new topic' do
        post :create, params: { topic: invalid_attributes }, session: valid_session
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

      it 'updates the requested topic' do
        topic = Topic.create! valid_attributes
        put :update, params: { id: topic.to_param, topic: new_attributes }, session: valid_session
        topic.reload
        skip('Add assertions for updated state')
      end

      it 'renders a JSON response with the topic' do
        topic = Topic.create! valid_attributes

        put :update, params: { id: topic.to_param, topic: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the topic' do
        topic = Topic.create! valid_attributes

        put :update, params: { id: topic.to_param, topic: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested topic' do
      topic = Topic.create! valid_attributes
      expect do
        delete :destroy, params: { id: topic.to_param }, session: valid_session
      end.to change(Topic, :count).by(-1)
    end
  end
end
