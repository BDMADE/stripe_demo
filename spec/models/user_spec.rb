require 'spec_helper'

RSpec.describe User, type: :model do
  auth_hash = OmniAuth::AuthHash.new({
                                       provider: 'facebook',
                                       uid: '1234',
                                       info: {
                                         email: 'user@example.com',
                                         name: 'Justin Bieber'
                                       }
                                     })

  describe User, '.from_omniauth' do
    
    it 'retrieves an existing user' do
      user = User.new(
        provider:  'facebook',
        uid: 1234,
        email: 'user@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user.save
      omniauth_user = User.from_omniauth(auth_hash)
      expect(user).to eq(omniauth_user)
    end

    it 'creates a new user if one does not already exist' do
      expect(User.count).to eq(0)
      User.from_omniauth(auth_hash)
      expect(User.count).to eq(1)
    end
  end
end
