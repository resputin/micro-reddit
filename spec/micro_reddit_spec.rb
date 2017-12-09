require 'rails_helper'

RSpec.describe MicroReddit do

  describe '#new' do
    it 'initializes a user with proper attributes' do
      attributes = { name: "Dylan" }

      expect { User.new(attributes) }.to_not raise_error 
    end
  end
end