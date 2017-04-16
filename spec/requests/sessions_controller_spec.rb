require 'rails_helper'

RSpec.describe "Sessions Requests" do
  before do
    @account = Account.create(username: 'ian', password: 'fido')  
  end

  context 'with valid credentials' do
    before do
      post '/api/v1/sessions', params: {username: 'ian', password: 'fido'}
    end

    it 'returns a 200 status code' do
      expect(response.status).to eq(200)
    end

    it 'returns the account id in the response body' do
      account  = JSON.parse(response.body)
      expect(account['id']).to eq(@account.id)
    end
  end

  context 'with invalid credentials' do
    it 'returns a 404 status code' do
      post '/api/v1/sessions', params: {username: 'ian', password: 'fidont'}
      expect(response.status).to eq(404)
    end
  end
end

