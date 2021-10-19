require 'rails_helper'

RSpec.describe User, type: :model do

describe 'Validations' do

  it 'should create a user with matching password and password_confirmation' do
    user = User.create(first_name: "yvette", last_name: "lim", email: "test@test.com", password: "secret", password_confirmation: "secret")

    expect(user.valid?).to be true

    user = User.create(first_name: "yvette", last_name: "lim", email: "test@test.com", password: "secret1", password_confirmation: "secret")

    expect(user.valid?).to be false
  end

  it 'should have a unique email and not case sensitive' do
    user = User.create(first_name: "yvette", last_name: "lim", email: "test@test.com", password: "secret", password_confirmation: "secret")
    user2 = User.create(first_name: "hazel", last_name: "ong", email: "TeSt@TeSt.com", password: "secret", password_confirmation: "secret")

    expect(user2.valid?).to be false
  end

  it 'should have an email address' do
    user = User.create(first_name: "yvette", last_name: "lim", email: nil, password: "secret", password_confirmation: "secret")

    expect(user.errors.full_messages).to include("Email can't be blank")    
  end

  it 'should have a first name' do
    user = User.create(first_name: nil, last_name: "lim", email: "test@test.com", password: "secret", password_confirmation: "secret")

    expect(user.errors.full_messages).to include("First name can't be blank")    
  end

  it 'should have a last name' do
    user = User.create(first_name: "yvette", last_name: nil, email: "test@test.com", password: "secret", password_confirmation: "secret")

    expect(user.errors.full_messages).to include("Last name can't be blank")    
  end

  it 'should have a password minimum length of 5 characters' do
    user = User.create(first_name: "yvette", last_name: "lim", email: "test@test.com", password: "abcd", password_confirmation: "secret")

    expect(user.valid?).to be false
  end

  end

  describe '.authenticate_with_credentials' do

    # before do
    #   user = User.create(first_name: "yvette", last_name: "lim", email: "test@test.com", password: "12345", password_confirmation: "secret")    
    # end
  
    it 'should login successfully even with few spaces in front/end of the email address' do
      
      user = User.authenticate_with_credentials('  test@test.com  ', 12345)

      expect(user).to be(user)
    end

    it 'should login successfully even with different types of "cAseS" of email address' do
      user = User.authenticate_with_credentials('TEst@TesT.cOm', 12345)
      
      expect(user).to be(user)
    end
  
  end
end
