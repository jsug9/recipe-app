require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  before :each do
    @name =  'name'
  end

  it 'tests it' do
    expect(@name).to eq 'name'
  end
end