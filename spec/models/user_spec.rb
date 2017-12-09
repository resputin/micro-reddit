require 'rails_helper'

RSpec.describe User do

  describe '#new' do
    it 'initializes a user with proper attributes' do
      attributes = { name: "Dylan" }

      expect { User.new(attributes) }.to_not raise_error 
    end

    it 'does not allow an invalide user to be created' do
      attributes = { name: "" }

      expect(User.new(attributes).valid?).to be(false)
    end
  end
end
