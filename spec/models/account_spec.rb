require 'rails_helper'

RSpec.describe Account, type: :model do
  it 'is valid with a username and  password' do
    expect(Account.new(username: 'ian', password: 'fido') ).to be_valid
  end

  it 'is invalid without a username' do
    account = Account.new
    account.valid?
    expect(account.errors.full_messages).to include("Username can't be blank")
  end
  it 'is invalid without a password' do
    account = Account.new
    account.valid?
    expect(account.errors.full_messages).to include("Password can't be blank")
  end
end

