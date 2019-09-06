require 'rails_helper'

describe "As a user" do
  describe "When I visit '/'" do
    describe "I select 'Greyjoy' from the dropdown And I click on 'Get Members'" do
      it "gets a list of members" do
        json_response = File.open("./fixtures/houses.json")
        stub_request(:get, "https://westeros-as-a-service.herokuapp.com/api/v1/house/5?api_key=dragon").
         with(
          headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v0.15.4',
       	  'X-Api-Key'=>'dragon'
          }).
         to_return(status: 200, body: json_response, headers: {})
        # members = subject.members_by_house('greyjoy')

        visit root_path

        page.select('Greyjoy', from: 'House')
        click_button 'Get Members'

        expect(current_path).to eq('/search')
        expect(page).to have_content('7 Members')

        within ".house_members" do
          expect(page).to have_content("ID: 38")
          expect(page).to have_content("Name: Balon Greyjoy")
          expect(page).to have_content("ID: 39")
          expect(page).to have_content("Name: Alannys Greyjoy")
          expect(page).to have_content("ID: 40")
          expect(page).to have_content("Name: Rodrik Greyjoy")
          expect(page).to have_content("ID: 41")
          expect(page).to have_content("Name: Maron Greyjoy")
          expect(page).to have_content("ID: 42")
          expect(page).to have_content("Name: Yara Greyjoy")
          expect(page).to have_content("ID: 43")
          expect(page).to have_content("Name: Theon Greyjoy")
          expect(page).to have_content("ID: 44")
          expect(page).to have_content("Name: Euron Greyjoy")
        end
      end
    end
  end
end
