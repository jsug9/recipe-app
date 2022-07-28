require 'rails_helper'

RSpec.describe 'Recipes Show Page', type: :feature do
  before(:each) do
    @user = User.new(
      name: 'Augusto',
      email: 'augusto@dev.com',
      password: '123456',
      password_confirmation: '123456',
      confirmed_at: Time.now,
      role: 'admin'
    )
    @user.skip_confirmation!
    @user.save!
    sign_in @user
    recipe = Recipe.create(
      name: 'Recipe 1',
      preparation_time: 1.1,
      cooking_time: 2.1,
      description: 'Very tasty dish description',
      user_id: @user.id,
      public: true
    )
    visit recipe_path(recipe)
  end

  it 'should have a name' do
    expect(page).to have_content('Recipe 1')
  end

  it 'should have a preparation time' do
    expect(page).to have_content('Preparation time 1.1 hrs')
  end

  it 'should have a cooking time' do
    expect(page).to have_content('Cooking time: 2.1')
  end
end
