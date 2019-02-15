require "application_system_test_case"

class VerificationsTest < ApplicationSystemTestCase
  setup do
    @verification = verifications(:one)
  end

  test "visiting the index" do
    visit verifications_url
    assert_selector "h1", text: "Verifications"
  end

  test "creating a Verification" do
    visit verifications_url
    click_on "New Verification"

    fill_in "Check1", with: @verification.check1
    fill_in "Check2", with: @verification.check2
    fill_in "Remarks", with: @verification.remarks
    click_on "Create Verification"

    assert_text "Verification was successfully created"
    click_on "Back"
  end

  test "updating a Verification" do
    visit verifications_url
    click_on "Edit", match: :first

    fill_in "Check1", with: @verification.check1
    fill_in "Check2", with: @verification.check2
    fill_in "Remarks", with: @verification.remarks
    click_on "Update Verification"

    assert_text "Verification was successfully updated"
    click_on "Back"
  end

  test "destroying a Verification" do
    visit verifications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Verification was successfully destroyed"
  end
end
