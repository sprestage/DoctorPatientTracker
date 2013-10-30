require "test_helper"

feature "Show patient index" do
  scenario "successfully see all patients in the index" do
    # Given existing patients
    # When I visit the patients path
    visit patients_path
    # Then I should see all patients
    page.text.must_include patients(:patient01).name
    page.text.must_include patients(:patient02).name
  end

end

