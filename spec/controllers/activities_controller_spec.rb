require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Activity. As you add validations to Activity, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
        time: DateTime.now,
        content: 'This is an activity',
        site: Site.first,
        topic: Topic.first
    }
  }

  let(:invalid_attributes) {
    {
        time: DateTime.now,
        content: '',
        site: nil,
        topic: 1
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ActivitiesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      activity = Activity.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      activity = Activity.create! valid_attributes
      get :show, params: {id: activity.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Activity" do
        expect {
          post :create, params: {activity: valid_attributes}, session: valid_session
        }.to change(Activity, :count).by(1)
      end

      it "renders a JSON response with the new activity" do

        post :create, params: {activity: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(activity_url(Activity.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new activity" do

        post :create, params: {activity: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested activity" do
        activity = Activity.create! valid_attributes
        put :update, params: {id: activity.to_param, activity: new_attributes}, session: valid_session
        activity.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the activity" do
        activity = Activity.create! valid_attributes

        put :update, params: {id: activity.to_param, activity: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the activity" do
        activity = Activity.create! valid_attributes

        put :update, params: {id: activity.to_param, activity: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  #describe "DELETE #destroy" do
  #  it "destroys the requested activity" do
  #    activity = Activity.create! valid_attributes
  #    expect {
  #      delete :destroy, params: {id: activity.to_param}, session: valid_session
  #    }.to change(Activity, :count).by(-1)
  #  end
  #end

end
