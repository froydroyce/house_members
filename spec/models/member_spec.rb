require 'rails_helper'

describe Member do
  it "exists" do
    attr = {
      name: 'Neil',
      id: 1
    }

    member = Member.new(attr)

    expect(member).to be_a Member
    expect(member.id).to eq(1)
    expect(member.name).to eq('Neil')
  end
end
