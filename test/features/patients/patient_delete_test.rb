require "test_helper"

feature "deleting a patient" do
  scenario "successfully delete patients" do
    # Given a patient
    visit patients_path
    # When I submit the form
    page.find("tr:last").click_on "Destroy"
    # Then I should receive a warning
    page.has_content?('Are you sure')
    # And the patient is no longer present
    page.text.must_include patients(:patient01).name
    page.text.must_include patients(:patient03).name
    page.wont_have_content "Second Patient"
  end

end

