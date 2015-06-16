require 'test_helper'

class InterferencesControllerTest < ActionController::TestCase
  setup do
    @interference = interferences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interferences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interference" do
    assert_difference('Interference.count') do
      post :create, interference: { target_user: @interference.target_user }
    end

    assert_redirected_to interference_path(assigns(:interference))
  end

  test "should show interference" do
    get :show, id: @interference
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @interference
    assert_response :success
  end

  test "should update interference" do
    patch :update, id: @interference, interference: { target_user: @interference.target_user }
    assert_redirected_to interference_path(assigns(:interference))
  end

  test "should destroy interference" do
    assert_difference('Interference.count', -1) do
      delete :destroy, id: @interference
    end

    assert_redirected_to interferences_path
  end
end
