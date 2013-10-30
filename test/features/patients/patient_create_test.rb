require "test_helper"

feature "Create patient" do
  scenario "successfully create patients" do
    # Given a completed new patient form
    visit new_patient_path
    fill_in "Name", with: patients(:patient04).name
    # When the form is submitted
    click_on "Create Patient"
    # Then a new patient should be created and displayed
    page.text.must_include "Patient was successfully created"
    page.text.must_include patients(:patient04).name
  end

end



