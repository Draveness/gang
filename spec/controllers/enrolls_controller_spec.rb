require 'rails_helper'

RSpec.describe EnrollsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Enroll. As you add validations to Enroll, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
        user: User.first,
        activity: Activity.first
    }
  }

  let(:invalid_attributes) {
    { user: nil, activity: nil }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EnrollsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      enroll = Enroll.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      enroll = Enroll.create! valid_attributes
      get :show, params: {id: enroll.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Enroll" do
        expect {
          post :create, params: {enroll: valid_attributes}, session: valid_session
        }.to change(Enroll, :count).by(1)
      end

      it "renders a JSON response with the new enroll" do

        post :create, params: {enroll: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(enroll_url(Enroll.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new enroll" do

        post :create, params: {enroll: invalid_attributes}, session: valid_session
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

      it "updates the requested enroll" do
        enroll = Enroll.create! valid_attributes
        put :update, params: {id: enroll.to_param, enroll: new_attributes}, session: valid_session
        enroll.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the enroll" do
        enroll = Enroll.create! valid_attributes

        put :update, params: {id: enroll.to_param, enroll: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the enroll" do
        enroll = Enroll.create! valid_attributes

        put :update, params: {id: enroll.to_param, enroll: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  #describe "DELETE #destroy" do
  #  it "destroys the requested enroll" do
  #    enroll = Enroll.create! valid_attributes
  #    expect {
  #      delete :destroy, params: {id: enroll.to_param}, session: valid_session
  #    }.to change(Enroll, :count).by(-1)
  #  end
  #end

end
