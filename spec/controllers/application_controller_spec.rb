require 'spec_helper'

describe ApplicationController, type: :controller do
  controller do
    def after_sign_in_path_for(resource)
      super resource
    end
  end

  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  describe 'After sign-in' do
    it 'redirects to the root path' do
      controller.after_sign_in_path_for(@user).should == root_path
    end
  end
end