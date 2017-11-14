require 'test_helper'

class QiandaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @qiandao = qiandaos(:one)
  end

  test "should get index" do
    get qiandaos_url
    assert_response :success
  end

  test "should get new" do
    get new_qiandao_url
    assert_response :success
  end

  test "should create qiandao" do
    assert_difference('Qiandao.count') do
      post qiandaos_url, params: { qiandao: {  } }
    end

    assert_redirected_to qiandao_url(Qiandao.last)
  end

  test "should show qiandao" do
    get qiandao_url(@qiandao)
    assert_response :success
  end

  test "should get edit" do
    get edit_qiandao_url(@qiandao)
    assert_response :success
  end

  test "should update qiandao" do
    patch qiandao_url(@qiandao), params: { qiandao: {  } }
    assert_redirected_to qiandao_url(@qiandao)
  end

  test "should destroy qiandao" do
    assert_difference('Qiandao.count', -1) do
      delete qiandao_url(@qiandao)
    end

    assert_redirected_to qiandaos_url
  end
end
