require 'rails_helper'

RSpec.describe Member do
  it 'exists and have attributes' do
    attributes = {
      name: "Leslie Knope",
      district: "1",
      role: "Representative",
      party: "Pizza"
    }

    member = Member.new(attributes)
    expect(member).to be_a Member
    expect(member.name).to eq("Leslie Knope")
    expect(member.role).to eq('Representative')
    expect(member.district).to eq('1')
    expect(member.party).to eq('Pizza')
  end
end