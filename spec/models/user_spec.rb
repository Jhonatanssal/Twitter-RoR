require 'rails_helper'

RSpec.describe User, type: :model do
  User.delete_all

  let!(:valid_user) { User.create(username: 'Test', fullname: 'Testing') }
  let!(:invalid_user) { User.create(username: 'Test', fullname: 'Testing') }
  let!(:invalid_user1) { User.create(username: nil, fullname: 'Nuna') }
  let!(:invalid_user2) { User.create(username: 'Chris', fullname: nil) }

  context 'Valid user' do
    it 'checks the uniqueness of username and presence of username and fullname' do
      expect(valid_user).to be_valid
    end
  end

  context 'Invalid user' do
    it 'checks the uniqueness of username' do
      expect(invalid_user).to be_invalid
    end

    it 'checks the presence of username' do
      expect(invalid_user1).to be_invalid
    end

    it 'checks the presence of fullname' do
      expect(invalid_user2).to be_invalid
    end
  end
end
