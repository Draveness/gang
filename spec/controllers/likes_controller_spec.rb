require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Like. As you add validations to Like, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
        user1: User.last,
        user2: User.first
    }
  }

  let(:invalid_attributes) {
    { user1: nil, user2: nil }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LikesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      like = Like.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      like = Like.create! valid_attributes
      get :show, params: {id: like.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Like" do
        expect {
          post :create, params: {like: valid_attributes}, session: valid_session
        }.to change(Like, :count).by(1)
      end

      it "renders a JSON response with the new like" do

        post :create, params: {like: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(like_url(Like.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new like" do

        post :create, params: {like: invalid_attributes}, session: valid_session
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

      it "updates the requested like" do
        like = Like.create! valid_attributes
        put :update, params: {id: like.to_param, like: new_attributes}, session: valid_session
        like.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the like" do
        like = Like.create! valid_attributes

        put :update, params: {id: like.to_param, like: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the like" do
        like = Like.create! valid_attributes

        put :update, params: {id: like.to_param, like: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  #describe "DELETE #destroy" do
  #  it "destroys the requested like" do
  #    like = Like.create! valid_attributes
  #    expect {
  #      delete :destroy, params: {id: like.to_param}, session: valid_session
  #    }.to change(Like, :count).by(-1)
  #  end
  #end

end
