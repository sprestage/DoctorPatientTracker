require "test_helper"

feature "Create doctor" do
  scenario "successfully create doctors" do
    # Given a completed new doctor form
    visit new_doctor_path
    fill_in "Name", with: doctors(:doctor04).name
    # When the form is submitted
    click_on "Create Doctor"
    # Then a new doctor should be created and displayed
    page.text.must_include "Doctor was successfully created"
    page.text.must_include doctors(:doctor04).name
  end

end



