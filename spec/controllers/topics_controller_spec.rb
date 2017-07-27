require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  let(:category) { create :category }
  let(:valid_attributes) do
    { name: 'Name', category_id: category.id, subtopics: %w[subtopic1 subtopic2] }
  end

  let(:invalid_attributes) do
    { name: '', category_id: category.id, subtopics: %w[subtopic1 subtopic2] }
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      create :topic
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    let(:topic) { create :topic }

    it 'returns a success response' do
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
    let(:topic) { create :topic }

    context 'with valid params' do
      let(:new_attributes) { { name: 'new-name' } }

      it 'updates the requested topic' do
        put :update, params: { id: topic.to_param, topic: new_attributes }, session: valid_session
        topic.reload
        expect(topic.name).to eq(new_attributes[:name])
      end

      it 'renders a JSON response with the topic' do
        put :update, params: { id: topic.to_param, topic: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the topic' do
        put :update, params: { id: topic.to_param, topic: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  # describe 'DELETE #destroy' do
  #   it 'destroys the requested topic' do
  #     topic = create :topic
  #     expect do
  #       delete :destroy, params: { id: topic.to_param }, session: valid_session
  #     end.to change(Topic, :count).by(-1)
  #   end
  # end
end
