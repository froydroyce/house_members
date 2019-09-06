require 'rails_helper'

describe WesterosService do
  context "instance methods" do
    it "returns member data" do
      json_response = File.open("./fixtures/house_members.json")
      stub_request(:get, "http://westerosapi.herokuapp.com/api/v1/house/greyjoy?api_key=#{ENV['WESTEROS_API']}").
        to_return(status: 200, body: json_response)
      members = subject.members_by_house('Greyjoy')
      binding.pry
      expect()

    end
  end
end
