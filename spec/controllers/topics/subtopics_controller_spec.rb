require 'rails_helper'

RSpec.describe Topics::SubtopicsController, type: :controller do
  let(:topic) { create :topic }
  let(:valid_attributes) { { content: 'Some kind of staff' } }
  let(:invalid_attributes) { { content: '' } }
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      create :subtopic
      get :index, params: { topic_id: topic.id }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    let(:subtopic) { create(:subtopic, topic_id: topic.id) }
    it 'returns a success response' do
      get :show, params: { topic_id: topic.id, id: subtopic.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Topics::Subtopic' do
        expect do
          post :create, params: { topic_id: topic.id, topic_subtopic: valid_attributes }, session: valid_session
          topic.reload
        end.to change(topic.subtopics, :count).by(1)
      end

      it 'renders a JSON response with the new topics_subtopic' do
        post :create, params: { topic_id: topic.id, topic_subtopic: valid_attributes }, session: valid_session
        topic.reload
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(topic_subtopic_url(topic.id, topic.subtopics.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new topics_subtopic' do
        post :create, params: { topic_id: topic.id, topic_subtopic: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    let(:subtopic) { create :subtopic, topic: topic }
    context 'with valid params' do
      let(:new_attributes) { { content: 'Another kind of staff' } }

      it 'updates the requested topics_subtopic' do
        put :update, params: { topic_id: topic.id, id: subtopic.to_param, topic_subtopic: new_attributes }, session: valid_session
        subtopic.reload
        expect(subtopic.content).to eq(new_attributes[:content])
      end

      it 'renders a JSON response with the topics_subtopic' do
        put :update, params: { topic_id: topic.id, id: subtopic.to_param, topic_subtopic: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the topics_subtopic' do
        put :update, params: { topic_id: topic.id, id: subtopic.to_param, topic_subtopic: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested topics_subtopic' do
      subtopic = create :subtopic, topic: topic
      expect do
        delete :destroy, params: { topic_id: topic.id, id: subtopic.to_param }, session: valid_session
        topic.reload
      end.to change(topic.subtopics, :count).by(-1)
    end
  end
end
