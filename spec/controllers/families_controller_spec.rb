require "rails_helper"

describe FamiliesController, type: :controller do
  let(:partner) { create :partner, name: "new partner" }
  let(:user) { create :user, partner: partner }
  let!(:family) { create :family, partner: partner }

  before do
    user.partner = partner
    sign_in user
  end

  describe "GET #index" do
    context "when responding csv" do
      subject { get :index, format: :csv }

      it "responds correct Content-Type" do
        expect(subject.headers["Content-Type"]).to eq "text/csv; charset=utf-8"
      end
    end
  end
end
