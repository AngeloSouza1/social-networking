require 'rails_helper'

RSpec.describe Subscription, type: :model do
  it "1. user can follow another user" do
    matt = FactoryBot.create(:user)
    bob = FactoryBot.create(:user)

    Subscription.create(followed: bob, followed_by: matt)
    expect(bob.followers.count).to eql 1
    expect(bob.followers).to include matt
  end

  it "2. Bob esteja na lista que o Matt segue" do
    matt = FactoryBot.create(:user)
    bob = FactoryBot.create(:user)

    Subscription.create(followed: bob, followed_by: matt)
    expect(matt.following.count).to eql 1
    expect(matt.following).to include bob
  end

  it "3. Bob nao esteja seguindo ninguem" do
    matt = FactoryBot.create(:user)
    bob = FactoryBot.create(:user)

    Subscription.create(followed: bob, followed_by: matt)
    expect(bob.following.count).to eql 0
    expect(bob.following).to_not include matt
  end

  it "4. Ninguém está seguindo Matt" do
    matt = FactoryBot.create(:user)
    bob = FactoryBot.create(:user)

    Subscription.create(followed: bob, followed_by: matt)
    expect(matt.followers.count).to eql 0
    expect(matt.followers).to_not include bob
  end

  it "5. Donald segue Bob" do
    matt = FactoryBot.create(:user)
    bob = FactoryBot.create(:user)
    donald = FactoryBot.create(:user)

    Subscription.create(followed: bob, followed_by: donald)
    Subscription.create(followed: bob, followed_by: matt)

    expect(bob.followers.count).to eql 2
    expect(bob.followers).to include donald
  end

  it "6. Donald tenha apenas uma pessoa seguindo e Bob esteja entre as pessoas que esta seguindo" do
    matt = FactoryBot.create(:user)
    bob = FactoryBot.create(:user)
    donald = FactoryBot.create(:user)

    Subscription.create(followed: bob, followed_by: donald)
    expect(donald.following.count).to eql 1
    expect(donald.following).to include bob
  end



end

