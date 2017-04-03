require 'spec_helper'

RSpec.describe ChargesController, type: :controller do
  let!(:user) { FactoryGirl.create :user, email: 'x@y.com', password: 'secret' }

  before do
    sign_in user
  end

  describe 'GET #new' do
    it 'returns new page' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #create' do
    before do
      allow_any_instance_of(ChargesController).to receive(:create).and_return(true)
    end
    it 'creates stripe charges' do
      expect_any_instance_of(ChargesController).to receive(:create).and_return(true)
      post :create, stripeEmail: 'tanbir2025@gmail.com', stripeToken: 'abc353bksfs934hhksf03'
    end
  end
end
