require 'rails_helper'

RSpec.describe User, type: :model do
  it "1. user is valid" do
    user = User.new(
      name: "Angelo",
      email: "angelo@ateste.com",
      phone: "9999900099",
      avatar: fixture_file_upload(Rails.root.join("spec", "support", "test-avatar.png"), "image/png"),
      password: "123456"
    )

    expect(user).to be_valid
  end

  it "2. user is NOT valid" do
    user = User.new(
      name: "Angelo",
      email: "angelo@ateste.com",
      phone: "9999900099",
      password: "123456"
    )

    expect(user).to_not be_valid
  end

  it "3. user should have a name" do
    user = User.new(
      email: "angelo@ateste.com",
      phone: "9999900099",
      avatar: fixture_file_upload(Rails.root.join("spec", "support", "test-avatar.png"), "image/png"),
      password: "123456"
    )

    expect(user).to_not be_valid
  end





end

