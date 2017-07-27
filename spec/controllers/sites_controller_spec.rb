require 'rails_helper'

RSpec.describe SitesController, type: :controller do
  let(:valid_attributes) do
    { name: 'TsingHua University', image: 'http://xxx.com/test.image', longitude: 84.132145, latitude: 31.432189 }
  end
  let(:invalid_attributes) { { name: '' } }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      create :site
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      site = create :site
      get :show, params: { id: site.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Site' do
        expect do
          post :create, params: { site: valid_attributes }, session: valid_session
        end.to change(Site, :count).by(1)
      end

      it 'renders a JSON response with the new site' do
        post :create, params: { site: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(site_url(Site.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new site' do
        post :create, params: { site: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    let(:site) { create :site }
    context 'with valid params' do
      let(:new_attributes) { { name: 'new site' } }

      it 'updates the requested site' do
        put :update, params: { id: site.to_param, site: new_attributes }, session: valid_session
        site.reload
        expect(site.name).to eq(new_attributes[:name])
      end

      it 'renders a JSON response with the site' do
        put :update, params: { id: site.to_param, site: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the site' do
        put :update, params: { id: site.to_param, site: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  # describe 'DELETE #destroy' do
  #   it 'destroys the requested site' do
  #     site = create :site
  #     expect do
  #       delete :destroy, params: { id: site.to_param }, session: valid_session
  #     end.to change(Site, :count).by(-1)
  #   end
  # end
end
