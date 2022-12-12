require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/widgets", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Widget. As you add validations to Widget, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # WidgetsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Widget.create! valid_attributes
      get widgets_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      widget = Widget.create! valid_attributes
      get widget_url(widget), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Widget" do
        expect {
          post widgets_url,
               params: { widget: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Widget, :count).by(1)
      end

      it "renders a JSON response with the new widget" do
        post widgets_url,
             params: { widget: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Widget" do
        expect {
          post widgets_url,
               params: { widget: invalid_attributes }, as: :json
        }.to change(Widget, :count).by(0)
      end

      it "renders a JSON response with errors for the new widget" do
        post widgets_url,
             params: { widget: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested widget" do
        widget = Widget.create! valid_attributes
        patch widget_url(widget),
              params: { widget: new_attributes }, headers: valid_headers, as: :json
        widget.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the widget" do
        widget = Widget.create! valid_attributes
        patch widget_url(widget),
              params: { widget: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the widget" do
        widget = Widget.create! valid_attributes
        patch widget_url(widget),
              params: { widget: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested widget" do
      widget = Widget.create! valid_attributes
      expect {
        delete widget_url(widget), headers: valid_headers, as: :json
      }.to change(Widget, :count).by(-1)
    end
  end
end
