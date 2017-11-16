require 'test_helper'

class TukusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tuku = tukus(:one)
  end

  test "should get index" do
    get tukus_url
    assert_response :success
  end

  test "should get new" do
    get new_tuku_url
    assert_response :success
  end

  test "should create tuku" do
    assert_difference('Tuku.count') do
      post tukus_url, params: { tuku: {  } }
    end

    assert_redirected_to tuku_url(Tuku.last)
  end

  test "should show tuku" do
    get tuku_url(@tuku)
    assert_response :success
  end

  test "should get edit" do
    get edit_tuku_url(@tuku)
    assert_response :success
  end

  test "should update tuku" do
    patch tuku_url(@tuku), params: { tuku: {  } }
    assert_redirected_to tuku_url(@tuku)
  end

  test "should destroy tuku" do
    assert_difference('Tuku.count', -1) do
      delete tuku_url(@tuku)
    end

    assert_redirected_to tukus_url
  end
end
