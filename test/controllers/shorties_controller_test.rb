require 'test_helper'

class ShortiesControllerTest < ActionController::TestCase
  setup do
    @shorty = shorties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shorties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shorty" do
    assert_difference('Shorty.count') do
      post :create, shorty: { dispersal_id: @shorty.dispersal_id, identifier: @shorty.identifier }
    end

    assert_redirected_to shorty_path(assigns(:shorty))
  end

  test "should show shorty" do
    get :show, id: @shorty
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shorty
    assert_response :success
  end

  test "should update shorty" do
    patch :update, id: @shorty, shorty: { dispersal_id: @shorty.dispersal_id, identifier: @shorty.identifier }
    assert_redirected_to shorty_path(assigns(:shorty))
  end

  test "should destroy shorty" do
    assert_difference('Shorty.count', -1) do
      delete :destroy, id: @shorty
    end

    assert_redirected_to shorties_path
  end
end
