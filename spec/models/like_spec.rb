require 'rails_helper'

RSpec.describe Like, type: :model do
  it "1. user likes a post" do
    andre = FactoryBot.create(:user)
    karina = FactoryBot.create(:user)
    joao = FactoryBot.create(:user)

    post = FactoryBot.create(:post, user: andre)

    Like.create(user: karina, post: post)

    expect(post.likes.count).to eql 1
    expect(post.likes.first.user).to eql karina

    Like.create(user: joao, post: post)
    expect(post.likes.count).to eql 2
    expect(post.likes.last.user).to eql joao

    Like.find_by(post: post, user: karina).destroy

    expect(post.likes.count).to eql 1
    expect(post.likes.first.user).to eql joao

  end
end

