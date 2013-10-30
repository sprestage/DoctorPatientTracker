require "test_helper"

feature "updating a doctor" do
  scenario "editor can successfully update doctors" do
    # Given an existing doctor
    visit doctor_path(doctors(:doctor02))
    click_on 'Edit'
    fill_in 'Name', with: "Second Doctor"
    # When I click edit and submit changed data
    click_on 'Update Doctor'
    # Then I should see the updated doctor
    page.text.must_include "Second Doctor"
    # And a success message
    page.text.must_include 'Doctor was successfully updated'
  end

end
