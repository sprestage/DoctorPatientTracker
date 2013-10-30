require "test_helper"

feature "Show a single patient" do
  scenario "successfully see any single patient" do
    # Given an existing patient
    # When I visit the show single patient page
    visit patient_path(patients(:patient01))
    # Then I see details for a patient.
    page.text.must_include patients(:patient01).name
    page.wont_have_content patients(:patient02).name
  end

end

