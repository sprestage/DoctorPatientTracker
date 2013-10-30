require "test_helper"

feature "Show a single doctor" do
  scenario "successfully see any single doctor" do
    # Given an existing doctor
    # When I visit the show single doctor page
    visit doctor_path(doctors(:doctor01))
    # Then I see details for a doctor.
    page.text.must_include doctors(:doctor01).name
    page.wont_have_content doctors(:doctor02).name
  end

end

