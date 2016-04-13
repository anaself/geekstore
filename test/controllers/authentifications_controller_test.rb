# == Schema Information
#
# Table name: authentifications
#
#  id         :integer          not null, primary key
#  local      :json
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class AuthentificationsControllerTest < ActionController::TestCase
  setup do
    @authentification = authentifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:authentifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create authentification" do
    assert_difference('Authentification.count') do
      post :create, authentification: {  }
    end

    assert_redirected_to authentification_path(assigns(:authentification))
  end

  test "should show authentification" do
    get :show, id: @authentification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @authentification
    assert_response :success
  end

  test "should update authentification" do
    patch :update, id: @authentification, authentification: {  }
    assert_redirected_to authentification_path(assigns(:authentification))
  end

  test "should destroy authentification" do
    assert_difference('Authentification.count', -1) do
      delete :destroy, id: @authentification
    end

    assert_redirected_to authentifications_path
  end
end
