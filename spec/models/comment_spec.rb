require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#new' do
    it 'initializes a comment on a post with proper attributes' do
      user = User.new(name: "Dylan")
      attributes = { body: "This is a comment", user: user }
      post = user.posts.new(title: "My great title", body: "A lot of words here")
      user.save!
      post.save!


      expect(post.comments.new(attributes).valid?).to be true
    end

    it 'initializes a comment on a comment with proper attributes' do
      user = User.new(name: "Dylan")
      user.save!
      attributes = { body: "This is a comment", user: user }
      post = user.posts.new(title: "My great title", body: "A lot of words here")
      post.save!
      comment = post.comments.new(attributes)
      comment.save!
      second_comment = comment.comments.new(attributes)


      expect(second_comment.valid?).to be true 
    end

    it 'does not allow an invalid comment to be created' do
      user = User.new(name: "Dylan")
      user.save!
      attributes = { body: "", user: user }
      post = user.posts.new(title: "My great title", body: "A lot of words here")
      post.save!
      comment = post.comments.new(attributes)

      expect(post.comments.new(attributes).valid?).to be false
    end
  end
end
