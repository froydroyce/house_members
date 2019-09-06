require 'rails_helper'

describe WesterosService do
  context "instance methods" do
    it "returns member data" do
      json_response = File.open("./fixtures/house_members.json")
      stub_request(:get, "http://westerosapi.herokuapp.com/api/v1/house/greyjoy?api_key=#{ENV['WESTEROS_API']}").
        to_return(status: 200, body: json_response)
      members = subject.members_by_house('greyjoy')

      expect(members).to be_an Hash
      expect(members.first).to be_a Array
      expect(members[:data].first[:attributes][:members].count).to eq(7)

      member_data = members[:data].first[:attributes][:members].first

      expect(member_data).to have_key(:id)
      expect(member_data).to have_key(:name)
    end
  end
end
