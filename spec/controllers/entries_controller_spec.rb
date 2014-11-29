require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe EntriesController, :type => :controller do

  before(:each) do
    @user = User.create!(email: "rspec_testuser@rtu.com", password: "asdfsadf")
    @journey = Journey.create(title: "Special journey", description: "Oh yeah", user_id: @user.id)

    sign_in @user
  end

  # This should return the minimal set of attributes required to create a valid
  # Entry. As you add validations to Entry, be sure to
  # adjust the attributes here as well.
  #let(:valid_attributes) { {title: "A valid title", body: "A valid body", journey_id: @journey.id, user_id: @user.id} }

  #let(:blank_title) { {title: "", body: "An invalid body", journey_id:@journey.id, user_id: @user.id} }
  #let(:blank_body) { {title: "An invalid title", body: "", journey_id:@journey.id, user_id: @user.id} }
  #let(:blank_journey_id) { {title: "An invalid title", body: "", user_id: @user.id} }

  #let(:long_title) { {title: "a" * 251, body: "A valid body", journey_id:@journey.id, user_id: @user.id} }
  #let(:long_body) { {title: "A valid title", body: "a" * 10001, journey_id:@journey.id, user_id: @user.id} }

=begin
  let(:valid_attributes) { {title: "A valid title", body: "A valid body", journey_id: @journey.id} }

  let(:blank_title) { {title: "", body: "An invalid body", journey_id:@journey.id} }
  let(:blank_body) { {title: "An invalid title", body: "", journey_id:@journey.id} }
  let(:blank_journey_id) { {title: "An invalid title", body: ""} }

  let(:long_title) { {title: "a" * 251, body: "A valid body", journey_id:@journey.id} }
  let(:long_body) { {title: "A valid title", body: "a" * 10001, journey_id:@journey.id} }
=end
  #
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EntriesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all entries as @entries" do
      entry = create(:entry)
      get :index, {journey_id: entry.journey_id}, valid_session
      expect(assigns(:entries)).to eq([entry])
    end
  end

  describe "GET show" do
    it "assigns the requested entry as @entry" do
      entry = create(:entry)
      get :show, {journey_id: entry.journey_id, :id => entry.to_param}, valid_session
      expect(assigns(:entry)).to eq(entry)
    end
  end

  describe "GET new" do
    it "assigns a new entry as @entry" do
      entry = create(:entry)
      get :new, {journey_id: entry.journey_id}, valid_session
      expect(assigns(:entry)).to be_a_new(Entry)
    end
  end

  describe "GET edit" do
    it "assigns the requested entry as @entry" do
      entry = create(:entry)
      get :edit, {journey_id: entry.journey_id, :id => entry.to_param}, valid_session
      expect(assigns(:entry)).to eq(entry)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Entry" do
        expect {
          #post :create, {journey_id: @journey.id, :entry => valid_attributes}, valid_session
          post :create, {journey_id: @journey.id, :entry => build_attributes(:entry, journey_id: @journey.id)}, valid_session
        }.to change(Entry, :count).by(1)
      end

      it "assigns a newly created entry as @entry" do
        entry = build_attributes(:entry)
        post :create, {journey_id: entry["journey_id"], :entry => entry}, valid_session
        expect(assigns(:entry)).to be_a(Entry)
        expect(assigns(:entry)).to be_persisted
      end

      it "redirects to the created entry" do
        entry = build_attributes(:entry)
        post :create, {journey_id: entry["journey_id"], :entry => entry}, valid_session
        # TODO: There must be a simpler way to specify the following redirect.
        expect(response).to redirect_to({controller: 'entries', action: 'show', journey_id: entry["journey_id"], id: Journey.find(entry["journey_id"]).entries.last.to_param})
      end
    end

    describe "with long title" do
      it "assigns a newly created but unsaved entry as @entry" do
        entry = build_attributes(:entry, title: "a"*251)
        post :create, {journey_id: entry["journey_id"], :entry => entry}, valid_session
        expect(assigns(:entry)).to be_a_new(Entry)
      end

      it "re-renders the 'new' template" do
        entry = build_attributes(:entry, title: "a"*251)
        post :create, {journey_id: entry["journey_id"], :entry => entry}, valid_session
        expect(response).to render_template("new")
      end
    end

    describe "with long body" do
      it "assigns a newly created but unsaved entry as @entry" do
        entry = build_attributes(:entry, body: "a"*10001)
        post :create, {journey_id: entry["journey_id"], :entry => entry}, valid_session
        expect(assigns(:entry)).to be_a_new(Entry)
      end

      it "re-renders the 'new' template" do
        entry = build_attributes(:entry, body: "a"*10001)
        post :create, {journey_id: entry["journey_id"], :entry => entry}, valid_session
        expect(response).to render_template("new")
      end
    end

    describe "with blank title" do
      it "assigns a newly created but unsaved entry as @entry" do
        entry = build_attributes(:entry, title: "")
        post :create, {journey_id: entry["journey_id"], :entry => entry}, valid_session
        expect(assigns(:entry)).to be_a_new(Entry)
      end

      it "re-renders the 'new' template" do
        entry = build_attributes(:entry, title: "")
        post :create, {journey_id: entry["journey_id"], :entry => entry}, valid_session
        expect(response).to render_template("new")
      end
    end

    describe "with blank body" do
      it "assigns a newly created but unsaved entry as @entry" do
        entry = build_attributes(:entry, body: "")
        post :create, {journey_id: entry["journey_id"], :entry => entry}, valid_session
        expect(assigns(:entry)).to be_a_new(Entry)
      end

      it "re-renders the 'new' template" do
        entry = build_attributes(:entry, body: "")
        post :create, {journey_id: entry["journey_id"], :entry => entry}, valid_session
        expect(response).to render_template("new")
      end
    end

    describe "with blank latitude" do
      it "assigns a newly created but unsaved entry as @entry" do
        entry = build_attributes(:entry, longitude: "")
        post :create, {journey_id: entry["journey_id"], :entry => entry}, valid_session
        expect(assigns(:entry)).to be_a_new(Entry)
      end

      it "re-renders the 'new' template" do
        entry = build_attributes(:entry, latitude: "")
        post :create, {journey_id: entry["journey_id"], :entry => entry}, valid_session
        expect(response).to render_template("new")
      end
    end

    describe "with low latitude" do
      it "assigns a newly created but unsaved entry as @entry" do
        entry = build_attributes(:entry, latitude: -91)
        post :create, {journey_id: entry["journey_id"], :entry => entry}, valid_session
        expect(assigns(:entry)).to be_a_new(Entry)
      end

      it "re-renders the 'new' template" do
        entry = build_attributes(:entry, latitude: -91)
        post :create, {journey_id: entry["journey_id"], :entry => entry}, valid_session
        expect(response).to render_template("new")
      end
    end

    describe "with large latitude" do
      it "assigns a newly created but unsaved entry as @entry" do
        entry = build_attributes(:entry, latitude: 91)
        post :create, {journey_id: entry["journey_id"], :entry => entry}, valid_session
        expect(assigns(:entry)).to be_a_new(Entry)
      end

      it "re-renders the 'new' template" do
        entry = build_attributes(:entry, latitude: 91)
        post :create, {journey_id: entry["journey_id"], :entry => entry}, valid_session
        expect(response).to render_template("new")
      end
    end
 
    describe "with blank longitude" do
      it "assigns a newly created but unsaved entry as @entry" do
        entry = build_attributes(:entry, longitude: "")
        post :create, {journey_id: entry["journey_id"], :entry => entry}, valid_session
        expect(assigns(:entry)).to be_a_new(Entry)
      end

      it "re-renders the 'new' template" do
        entry = build_attributes(:entry, longitude: "")
        post :create, {journey_id: entry["journey_id"], :entry => entry}, valid_session
        expect(response).to render_template("new")
      end
    end

    describe "with low longitude" do
      it "assigns a newly created but unsaved entry as @entry" do
        entry = build_attributes(:entry, longitude: -181)
        post :create, {journey_id: entry["journey_id"], :entry => entry}, valid_session
        expect(assigns(:entry)).to be_a_new(Entry)
      end

      it "re-renders the 'new' template" do
        entry = build_attributes(:entry, longitude: -181)
        post :create, {journey_id: entry["journey_id"], :entry => entry}, valid_session
        expect(response).to render_template("new")
      end
    end

    describe "with large longitude" do
      it "assigns a newly created but unsaved entry as @entry" do
        entry = build_attributes(:entry, longitude: 181)
        post :create, {journey_id: entry["journey_id"], :entry => entry}, valid_session
        expect(assigns(:entry)).to be_a_new(Entry)
      end

      it "re-renders the 'new' template" do
        entry = build_attributes(:entry, longitude: 181)
        post :create, {journey_id: entry["journey_id"], :entry => entry}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) { {title: "A new valid title", body: "A new valid body"} }

      it "updates the title" do
        entry = create(:entry)
        put :update, {journey_id: entry.journey_id, :id => entry.to_param, :entry => new_attributes}, valid_session
        entry.reload
        expect(entry.title).to eq(new_attributes[:title])
      end

      it "updates the body" do
        entry = create(:entry)
        put :update, {journey_id: entry.journey_id, :id => entry.to_param, :entry => new_attributes}, valid_session
        entry.reload
        expect(entry.body).to eq(new_attributes[:body])
      end

      it "assigns the requested entry as @entry" do
        entry = create(:entry)
        put :update, {journey_id: entry.journey_id, :id => entry.to_param, :entry => new_attributes}, valid_session
        expect(assigns(:entry)).to eq(entry)
      end

      it "redirects its parent journey" do
        entry = create(:entry)
        put :update, {journey_id: entry.journey_id, :id => entry.to_param, :entry => new_attributes}, valid_session
        expect(response).to redirect_to(Journey.find(entry.journey_id))
      end
    end

    describe "with long title" do
      let(:long_title) { {title: "a"*251, body: "A new valid body"} }

      it "assigns the entry as @entry" do
        entry = create(:entry)
        put :update, {journey_id: entry.journey_id, :id => entry.to_param, :entry => long_title}, valid_session
        expect(assigns(:entry)).to eq(entry)
      end

      it "re-renders the 'edit' template" do
        entry = create(:entry)
        put :update, {journey_id: entry.journey_id, :id => entry.to_param, :entry => long_title}, valid_session
        expect(response).to render_template("edit")
      end
    end

    describe "with long body" do
      let(:long_body) { {title: "A new valid title", body: "a"*10001} }

      it "assigns the entry as @entry" do
        entry = create(:entry)
        put :update, {journey_id: entry.journey_id, :id => entry.to_param, :entry => long_body}, valid_session
        expect(assigns(:entry)).to eq(entry)
      end

      it "re-renders the 'edit' template" do
        entry = create(:entry)
        put :update, {journey_id: entry.journey_id, :id => entry.to_param, :entry => long_body}, valid_session
        expect(response).to render_template("edit")
      end
    end
    
    describe "with blank title" do
      let(:blank_title) { {title: "", body: "A new valid body"} }

      it "assigns the entry as @entry" do
        entry = create(:entry)
        put :update, {journey_id: entry.journey_id, :id => entry.to_param, :entry => blank_title}, valid_session
        expect(assigns(:entry)).to eq(entry)
      end

      it "re-renders the 'edit' template" do
        entry = create(:entry)
        put :update, {journey_id: entry.journey_id, :id => entry.to_param, :entry => blank_title}, valid_session
        expect(response).to render_template("edit")
      end
    end

    describe "with blank body" do
      let(:blank_body) { {title: "A new valid title", body: ""} }

      it "assigns the entry as @entry" do
        entry = create(:entry)
        put :update, {journey_id: entry.journey_id, :id => entry.to_param, :entry => blank_body}, valid_session
        expect(assigns(:entry)).to eq(entry)
      end

      it "re-renders the 'edit' template" do
        entry = create(:entry)
        put :update, {journey_id: entry.journey_id, :id => entry.to_param, :entry => blank_body}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested entry" do
      entry = create(:entry)
      expect {
        delete :destroy, {journey_id: entry.journey_id, :id => entry.to_param}, valid_session
      }.to change(Journey.find(entry.journey_id).entries, :count).by(-1)
    end

    it "redirects to its parent journey" do
      entry = create(:entry)
      delete :destroy, {journey_id: entry.journey_id, :id => entry.to_param}, valid_session
      expect(response).to redirect_to(Journey.find(entry.journey_id))
    end
  end

end
