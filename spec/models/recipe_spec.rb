RSpec.describe Recipe, type: :model do
  before(:each) do
    user = User.create(name: 'Augusto', email: 'augusto@dev.com', password: '123456', password_confirmation: '123456',
                       confirmed_at: Time.now, role: 'admin')
    @recipe = Recipe.create(name: 'tasty', preparation_time: 1.0, cooking_time: 1.0,
                            description: 'Very tasty dish description', user_id: user.id, public: true)
  end

  it 'Recipe should be valid' do
    expect(@recipe).to be_valid
  end
end
