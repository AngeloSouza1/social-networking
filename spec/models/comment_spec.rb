require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "1. user comments on a post" do

    lucas = FactoryBot.create(:user)
    sergio = FactoryBot.create(:user)

    post = FactoryBot.create(:post, user: lucas)

    comment = FactoryBot.create(:comment, user: sergio, post: post)

    expect(post.comments.count).to eql 1
    expect(post.comments.first.user).to eql sergio

    expect(post.comments.first.body).to eql "Post manero!"
    expect(post.comments.first).to eql comment

  end

end

