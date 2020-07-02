require 'rails_helper'

# Three main things we are testing here:
# 1. validations
# 2. relationships
# 3. class / instance methods

RSpec.describe Song do
  describe 'validations' do
    it { should validate_presence_of :title }
  end
end