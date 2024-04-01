require 'rails_helper'

RSpec.describe Post, type: :model do
  it "1. post is NOT valid" do
    post = FactoryBot.build(:post)

    expect(post).to_not be_valid
  end

  it "2. post is valid" do
    post = FactoryBot.build(:post)

    expect(post).to_not be_valid

    post.user = FactoryBot.build(:user)
    post.save

    expect(post).to be_valid
  end

  it "3. post belongs to user" do
     user = FactoryBot.create(:user)
    post = FactoryBot.create(:post, user: user)

    expect(post.user).to eql user
  end

  it "4. user has many posts" do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post, user: user)

    expect(user.posts).to include post
  end










end

