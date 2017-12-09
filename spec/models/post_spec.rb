require 'rails_helper'

RSpec.describe Post do
  describe '#new' do
    it 'initializes a post with proper attributes' do
      user = User.new(name: "Dylan")
      attributes = { title: "My great title", body: "A lot of words here" }

      expect { user.posts.new(attributes) }.to_not raise_error 
    end

    it 'does not allow an invalid post to be created' do
      user = User.new(name: "Dylan")
      attributes = { title: "", body: "" }

      expect(user.posts.new(attributes).valid?).to be(false)
    end
  end
end
