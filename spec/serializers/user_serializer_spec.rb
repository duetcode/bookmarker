# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserSerializer, type: :serializer do
  let(:user) { FactoryBot.build(:user, email: 'user@duetcode.io') }
  let(:serialized_user) { described_class.new(user).as_json }

  subject { serialized_user[:user] }

  it 'has an email that matches with the user email' do
    expect(subject[:email]).to eq('user@duetcode.io')
  end
end
