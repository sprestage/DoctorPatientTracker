require "test_helper"

feature "updating a patient" do
  scenario "editor can successfully update patients" do
    # Given an existing patient
    visit patient_path(patients(:patient02))
    click_on 'Edit'
    fill_in 'Name', with: "Second Patient"
    # When I click edit and submit changed data
    click_on 'Update Patient'
    # Then I should see the updated patient
    page.text.must_include "Second Patient"
    # And a success message
    page.text.must_include 'Patient was successfully updated'
  end

end
