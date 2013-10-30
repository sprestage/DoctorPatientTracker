require "test_helper"

feature "Show doctor index" do
  scenario "successfully see all doctors in the index" do
    # Given existing doctors
    # When I visit the doctors path
    visit doctors_path
    # Then I should see all doctors
    page.text.must_include doctors(:doctor01).name
    page.text.must_include doctors(:doctor02).name
  end

end

