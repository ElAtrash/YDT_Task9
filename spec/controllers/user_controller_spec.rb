require 'rails_helper'
require 'faker'

RSpec.describe UsersController, type: :controller do
  before(:each) do
    @user = User.create(
      login: Faker::Internet.unique.username,
      type: "Neutrality",
      email: Faker::Internet.unique.email,
      password: Faker::Internet.password(min_length: 6)
    )
  end

  it "doesn't allow to access data without sign in" do
    get "index", format: :json
    expect(response.status).to eq(401)
    puts "================ #{response.body}"
  end

  it "does allow to access data to signed in users" do
    sign_in @user
    get :index
    expect(response.status).to eq(200)
    puts "=========success======= #{response.body}"
  end
end