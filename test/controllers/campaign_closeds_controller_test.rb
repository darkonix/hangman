require 'test_helper'

class CampaignClosedsControllerTest < ActionController::TestCase
  setup do
    @campaign_closed = campaign_closeds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:campaign_closeds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create campaign_closed" do
    assert_difference('CampaignClosed.count') do
      post :create, campaign_closed: { campaign_id: @campaign_closed.campaign_id, clicks: @campaign_closed.clicks, ends: @campaign_closed.ends }
    end

    assert_redirected_to campaign_closed_path(assigns(:campaign_closed))
  end

  test "should show campaign_closed" do
    get :show, id: @campaign_closed
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @campaign_closed
    assert_response :success
  end

  test "should update campaign_closed" do
    patch :update, id: @campaign_closed, campaign_closed: { campaign_id: @campaign_closed.campaign_id, clicks: @campaign_closed.clicks, ends: @campaign_closed.ends }
    assert_redirected_to campaign_closed_path(assigns(:campaign_closed))
  end

  test "should destroy campaign_closed" do
    assert_difference('CampaignClosed.count', -1) do
      delete :destroy, id: @campaign_closed
    end

    assert_redirected_to campaign_closeds_path
  end
end
