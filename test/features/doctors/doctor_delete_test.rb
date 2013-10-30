require "test_helper"

feature "deleting a doctor" do
  scenario "successfully delete doctors" do
    # Given a doctor
    visit doctors_path
    # When I submit the form
    page.find("tr:last").click_on "Destroy"
    # Then I should receive a warning
    page.has_content?('Are you sure')
    # And the doctor is no longer present
    page.text.must_include doctors(:doctor02).name
    page.text.must_include doctors(:doctor03).name
    page.wont_have_content "First doctor"
  end

end

