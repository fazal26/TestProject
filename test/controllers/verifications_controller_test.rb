require 'test_helper'

class VerificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @verification = verifications(:one)
  end

  test "should get index" do
    get verifications_url
    assert_response :success
  end

  test "should get new" do
    get new_verification_url
    assert_response :success
  end

  test "should create verification" do
    assert_difference('Verification.count') do
      post verifications_url, params: { verification: { check1: @verification.check1, check2: @verification.check2, remarks: @verification.remarks } }
    end

    assert_redirected_to verification_url(Verification.last)
  end

  test "should show verification" do
    get verification_url(@verification)
    assert_response :success
  end

  test "should get edit" do
    get edit_verification_url(@verification)
    assert_response :success
  end

  test "should update verification" do
    patch verification_url(@verification), params: { verification: { check1: @verification.check1, check2: @verification.check2, remarks: @verification.remarks } }
    assert_redirected_to verification_url(@verification)
  end

  test "should destroy verification" do
    assert_difference('Verification.count', -1) do
      delete verification_url(@verification)
    end

    assert_redirected_to verifications_url
  end
end
