require 'rails_helper'

RSpec.describe 'Recipes Index Page', type: :feature do
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
    (1..5).each do |id|
      Recipe.create(
        name: "Recipe #{id}",
        preparation_time: 1.1,
        cooking_time: 2.1,
        description: "Very tasty dish description",
        user_id: @user.id,
        public: true
      )
    end
    visit recipes_path
  end

  it 'should have 5 recipes' do
    expect(page).to have_content('Recipe 1')
    expect(page).to have_content('Recipe 2')
    expect(page).to have_content('Recipe 3')
    expect(page).to have_content('Recipe 4')
    expect(page).to have_content('Recipe 5')
  end
end
