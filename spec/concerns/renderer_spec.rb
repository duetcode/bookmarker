# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Renderer, type: :controller do
  before do
    ActiveRecord::Base.connection.create_table :dummies, force: true do |t|
      t.string(:name)

      t.timestamps null: false
    end
  end

  after do
    ActiveRecord::Base.connection.drop_table(:dummies, if_exists: true)
  end

  class Dummy < ApplicationRecord
    validates :name, presence: true
  end

  class DummySerializer < BaseSerializer
    attributes :name
  end

  FactoryBot.define do
    factory :dummy do
      name { 'sample' }
    end
  end

  controller(ApplicationController) do
    include Renderer

    def show
      dummy = Dummy.find(params[:id])
      render_object(dummy)
    end

    def create
      dummy = Dummy.create(dummy_params)
      render_errors(dummy.errors)
    end

    private

    def dummy_params
      params.require(:dummy).permit(:name)
    end
  end

  describe 'GET show' do
    let(:resource) { create(:dummy, name: 'sample') }

    it 'renders resource with render_object method' do
      get :show, params: { id: resource.id }

      resource_fields = { 'id' => resource.id, 'name' => resource.name }

      expect(response.status).to eq(200)
      expect(load_body(response)['dummy']).to include(resource_fields)
    end
  end

  describe 'POST create' do
    it 'renders resource errors with render_errors method' do
      post :create, params: { dummy: { name: nil } }

      error_fields = {
        'name' => ['can\'t be blank']
      }

      expect(response.status).to eq(422)
      expect(load_body(response)).to eq(error_fields)
    end
  end
end
